//
//  CustomGridView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 14.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content: View {
    let items: [T]
    let columns: Int
    let content: (CGFloat, T) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideSize = geometry.size.width / CGFloat(columns)
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(sideSize, items[index])
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [11, 3, 7, 17, 5, 2, 1], columns: 3) { itemSize, item  in
            ZStack {
                Color.purple
                Text("\(item)")
            }
            .padding()
            .frame(width: itemSize, height: itemSize)
        }
    }
}
