//
//  AchievementView.swift
//  AwordsCollectionApp
//
//  Created by Nikita Benin on 13.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct AchievementView: View {
    
    let width: CGFloat
    let height: CGFloat
        
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            ZStack {
                ForEach(0..<9) { iteration in
                    Ellipse()
                        .stroke(RadialGradient(gradient: Gradient(colors: [Color.green, Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 0, endRadius: middle), lineWidth: 4)
                        .rotationEffect(.degrees(Double(iteration) * 20))
                        .frame(width: farLine + nearLine, height: middle)
                }
                .shadow(radius: 2)
                
                Circle()
                    .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255),
                            radius: 3, x: 2, y: 2)
                    .foregroundColor(.white)
                    .frame(width: middle - nearLine)
                LinearGradient(gradient: Gradient(colors: [.white, .blue]),
                               startPoint: .bottomLeading,
                               endPoint: .bottom)
                    .mask(
                        Text("1m")
                            .font(.system(size: 48, weight: .heavy))
                    )
                
            }
            .scaleEffect(0.9)
            .innerCircleShadow()
        }
        .frame(width: width, height: height)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(width: 250, height: 250)
    }
}
