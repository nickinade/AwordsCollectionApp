//
//  ShapesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI


struct ShapesView: View {
    let awards = Award.getAwards()
    
    var activeAward: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            CustomGridView(items: activeAward, columns: 2) { itemSize, award in
                VStack {
                    award.awardView
                    Text(award.title)
                }
                .padding()
                .frame(width: itemSize, height: itemSize)
            }
            .navigationBarTitle("Your awards: \(activeAward.count)")
        }
    }
}


//struct ShapesView: View {
//    let awards = Award.getAwards()
//    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
//
//    var activeAward: [Award] {
//        awards.filter { $0.awarded }
//    }
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(activeAward, id: \.title) { award in
//                        VStack {
//                            award.awardView
//                            Text(award.title)
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Your awards: \(activeAward.count)")
//        }
//    }
//}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
