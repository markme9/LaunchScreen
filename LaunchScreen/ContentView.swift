//
//  ContentView.swift
//  LaunchScreen
//
//  Created by mark me on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    @State var endAnimation: Bool = false
    
    @State var title: String = "Launch Screen"
    @State var index: Double = 0.0
    @State var char: String = ""
    
    var body: some View {
        
        // For Home Screen
        ZStack {
            
            Home()
            
            
            // For Launch Screen
            
            ZStack {
                Color("back")
                
                Image("icon")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 85, height: 85)
                
                // You can modified according your choice like animation timing of fonts
                    
                    .scaleEffect(isPresented ? 3 : 1)
                
                // For Custom Fonts
                
                Text(char)
                    .font(.custom("PlayfairDisplay-ExtraBold", size: 40))
                    .foregroundColor(Color.white)
                    .offset(y: 75)
                
                    .onAppear {
                        for number in title {
                            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false, block: { _ in
                                self.char.append(number)
                            })
                            withAnimation {
                                index += 1
                            }
                        }
                    }
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animationSpalsh)
            .opacity(endAnimation ? 0 : 1)
        }
    }
    
    func animationSpalsh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            withAnimation(Animation.easeOut(duration: 0.45)) {
                isPresented.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.50)) {
                endAnimation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.custom("PlayfairDisplay-ExtraBold", size: 40))
        }
    }
}
