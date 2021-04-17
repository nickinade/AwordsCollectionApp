//
//  VerticalGridViewe.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 14.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct VerticalGridViewe: View {
    
    let data = (1...100).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible(maximum: 70)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct VerticalGridViewe_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGridViewe()
    }
}
