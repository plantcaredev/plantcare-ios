//
//  ScrollableTabBarItemCapule.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-17.
//

import SwiftUI

struct ScrollableTabBarItemCapsule: View {
    var isSelected: Bool
    var text: String

    var body: some View {
        VStack {
            Text(text)
                .font(.custom("Mulish-Regular", size: 20))
        }
        .padding([.top, .bottom], 5)
        .padding([.trailing, .leading])
        .background(isSelected ? .black : .clear)
        .foregroundColor(isSelected ? .white : .gray)
        .cornerRadius(8)
    }
}

struct ScrollableTabBarItemCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableTabBarItemCapsule(isSelected: true, text: "hello")
    }
}
