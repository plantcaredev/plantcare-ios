//
//  BottomBarSection.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct BottomBarSection: View {
    var icon: String
    var text: String
    var isSelected: Bool
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(text)
                .font(.custom("Mulish-Regular", size: 12))
            Circle()
                .fill(isSelected ? Color("DarkPurple") : .white)
                .frame(width: 10, height: 10)
                .offset(y: -5)
        }
        .foregroundColor(isSelected ? Color("DarkPurple") : .gray)
    }
}

// struct BottomBarSection_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomBarSection()
//    }
// }
