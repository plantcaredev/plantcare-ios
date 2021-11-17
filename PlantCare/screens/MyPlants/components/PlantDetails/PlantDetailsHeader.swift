//
//  PlantDetailsHeader.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-12.
//

import SwiftUI

struct PlantDetailsHeader: View {
    var plant: PlantUI
    var frameHeight: CGFloat
    var frameWidth: CGFloat
    var safeAreaTop: CGFloat
    var dismiss: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding([.leading])
            }
            VStack {
                HStack {
                    Text(plant.name)
                        .foregroundColor(.black)
                        .font(.custom("Mulish-ExtraBold", size: 30))
                        .padding([.trailing, .leading])
                    Spacer()
                }
                HStack {
                    Text(plant.location)
                        .foregroundColor(.gray)
                        .font(.custom("Mulish-Regular", size: 16))
                        .padding([.trailing, .leading])
                    Spacer()
                }
            }
        }
        .frame(height: frameHeight * 0.1)
        .frame(width: frameWidth)
        .padding([.top], safeAreaTop)
        .background(.ultraThinMaterial)
    }
}

// struct PlantDetailsHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantDetailsHeader()
//    }
// }
