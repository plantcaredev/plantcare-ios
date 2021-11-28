//
//  LoadingScreen.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Text("PlantCare")
                .foregroundColor(.white)
                .font(.custom("Mulish-ExtraBold", size: 34))
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            Image("SmallPlant1")
            Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .background(Color("MainDark"))
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
