//
//  PlantDetailsImage.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-12.
//

import SwiftUI

struct PlantDetailsImage: View {
    var plant: PlantUI
    var frameHeight: CGFloat
    var frameWidth: CGFloat
//    var scrollOffset: CGFloat

    @Binding var showImageViewer: Bool
    
    var body: some View {
        VStack {
            if plant.hasImage {
                AsyncImage(url: URL(string: plant.image)) { image in
                    
                    image.resizable()
                        .scaledToFill()
                        .frame(height: frameHeight * 0.35)
                        .frame(width: frameWidth)
                        .clipped()
                        .onTapGesture {
                            showImageViewer.toggle()
                        }
                } placeholder: {
                    HStack {
                        Spacer()
                        ProgressView()
                            .frame(height: frameHeight * 0.35)
                            .frame(width: frameWidth)
                        Spacer()
                    }
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            } else {
                HStack {
                    Spacer()
                    Image("SmallPlant2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frameHeight * 0.2)
                    Spacer()
                }
                    .frame(height: frameHeight * 0.35)
                    .background(Color("LightPink"))
            }
        }
    }
}

