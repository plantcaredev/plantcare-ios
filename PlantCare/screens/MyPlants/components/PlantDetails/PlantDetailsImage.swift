//
//  PlantDetailsImage.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-12.
//

import SwiftUI
import CachedAsyncImage

struct PlantDetailsImage: View {
    var plant: PlantUI
    var frameHeight: CGFloat
    var frameWidth: CGFloat
    var topOffset: CGFloat

    @Binding var showImageViewer: Bool

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if plant.hasImage {
                    CachedAsyncImage(url: URL(string: plant.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .onTapGesture {
                                showImageViewer.toggle()

                            }
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                                .frame(height: frameHeight * 0.6)
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
                    .frame(height: frameHeight * 0.5)
                }
            }
            .frame(width: frameWidth - 40, height: frameHeight * 0.6)
            .background(plant.hasImage ? .clear : Color("LightPink"))
            .cornerRadius(20)
            .padding([.top], topOffset)
            .clipped()
            HStack {
                VStack {
                    HStack {
                        Text(plant.name)
                            .foregroundColor(.white)
                            .font(.custom("Mulish-ExtraBold", size: 30))
                            .padding([.trailing, .leading])
                        Spacer()
                    }
                    HStack {
                        Text(plant.location)
                            .foregroundColor(.white)
                            .font(.custom("Mulish-Regular", size: 16))
                            .padding([.trailing, .leading])
                        Spacer()
                    }
                }
                Spacer()
            }
            .frame(maxWidth: frameWidth - 60)
            .frame(height: 80)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
        }
        .background(Color.white
            .frame(width: frameWidth - 40, height: frameHeight * 0.6)
            .cornerRadius(20) // any non-transparent background
            .padding([.top], topOffset)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0))
    }
}
