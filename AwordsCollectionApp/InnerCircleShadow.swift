//
//  InnerCircleShadow.swift
//  AwordsCollectionApp
//
//  Created by Nikita Benin on 14.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct InnerCircleShadow: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
                .overlay(
                    Circle()
                        .stroke(Color(red: 236/255, green: 234/255, blue: 235/255),
                                lineWidth: 4)
                        .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255),
                                radius: 3, x: 5, y: 5)
                        .clipShape(
                            Circle()
                        )
                        .shadow(color: .white, radius: 2, x: -2, y: -2)
                        .clipShape(
                            Circle()
                        )
                )
        }
    }
}

extension View {
    func innerCircleShadow() -> some View {
        self.modifier(InnerCircleShadow())
    }
}
