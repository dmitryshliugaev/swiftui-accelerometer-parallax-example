//
//  ContentView.swift
//  AccelerometerParallaxExample
//
//  Created by Dmitry Shlyugaev on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = MotionManager()
    
    var Photo: some View = Image("shot")
        .resizable()
        .aspectRatio(contentMode: .fit)
    
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            
            Photo
                .cornerRadius(32)
                .blur(radius: 5)
                .offset(y: 10)
                .opacity(0.9)
                .frame(width: UIScreen.main.bounds.width - 100)
                .overlay(Photo
                            .cornerRadius(12)
                            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 30)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
