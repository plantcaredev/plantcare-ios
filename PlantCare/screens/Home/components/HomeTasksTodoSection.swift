//
//  HomeTasksTodoSection.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-17.
//

import SwiftUI

struct HomeTasksTodoSection: View {
    @Binding var selection: Int
    var body: some View {
        ScrollableTabBar(selection: $selection, contentHeight: 250) {
            ScrollableTabBarItemCapsule(isSelected: selection == 0, text: "To Water")
            ScrollableTabBarItemCapsule(isSelected: selection == 1, text: "To Mist")
        } content: {
            VStack {
                Text("You're all set for today.")
                    .font(.custom("Mulish-Regular", size: 20))
                    .padding([.top])
                    .foregroundColor(Color("MainDark"))
                LottieView(name: "ManWatering", loopMode: .loop)
                    .frame(width: 250, height: 200)
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity)

            VStack {
                Text("Nothing to worry about here.")
                    .font(.custom("Mulish-Regular", size: 20))
                    .padding([.top])
                    .foregroundColor(Color("MainDark"))
                LottieView(name: "SleepingSloth", loopMode: .loop)
                    .frame(width: 200, height: 200)
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
