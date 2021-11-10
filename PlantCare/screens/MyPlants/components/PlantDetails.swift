//
//  PlantDetails.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-09.
//

import SwiftUI

struct PlantDetails: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var plant: Plant

    @State var inEditMode: Bool = false
    @State var plantName: String

    init(plant: Plant) {
        self.plant = plant
        _plantName = State(initialValue: plant.name)
    }

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    ZStack {
                        if plant.image.count > 0 {
                            AsyncImage(url: URL(string: plant.image)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(height: geo.size.height * 0.35)
                                    .frame(width: geo.size.width)
                                    .clipped()
                            } placeholder: {
                                HStack {
                                    Spacer()
                                    ProgressView()
                                        .frame(height: geo.size.height * 0.35)
                                        .frame(width: geo.size.width)
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
                                    .frame(height: geo.size.height * 0.2)
                                Spacer()
                            }
                                .frame(height: geo.size.height * 0.35)
                                .background(Color("LightPink"))
                        }

                        Color(.white)
                            .frame(maxWidth: .infinity)
                            .offset(x: 0, y: 0)
                            .frame(height: geo.size.height * 0.05)
                            .cornerRadius(30, corners: [.topLeft, .topRight])
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -20)
                            .offset(y: geo.size.height * 0.18)
                    }
                    VStack {
                        ScrollView {
                            VStack {
                                HStack {
                                    Text(plant.name)
                                        .foregroundColor(Color("DarkPurple"))
                                        .font(.custom("Mulish-ExtraBold", size: 30))

                                    Spacer()
                                }
                                HStack {
                                    Text(plant.location)
                                        .foregroundColor(.gray)
                                        .font(.custom("Mulish-Regular", size: 16))
                                    Spacer()
                                }
                            }
                                .padding([.trailing, .leading])
                        }
                    }
                }
            }
                .ignoresSafeArea(edges: [.top])
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }) {
                Image(systemName: "arrow.backward.circle.fill")
                    .background(.white)
                    .cornerRadius(40)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
            }
        )
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            PlantDetails(plant: mock_plants[0])
        }
            .navigationBarHidden(true)
    }
}
