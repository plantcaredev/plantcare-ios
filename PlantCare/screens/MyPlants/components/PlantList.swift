//
//  PlantList.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-09.
//

import SwiftUI

struct PlantList: View {
    var plants: [PlantUI]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(plants) { plant in
                    NavigationLink(destination: PlantDetails(plant: plant)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(plant.name)
                                    .font(.custom("Mulish-ExtraBold", size: 20))
                                    .foregroundColor(Color("DarkPurple"))
                                    .padding(.bottom, 1)
                                Text(plant.location)
                                    .font(.custom("Mulish-Regular", size: 14))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                if plant.hasImage {
                                    AsyncImage(url: URL(string: plant.image)) { image in
                                        image.resizable()
                                            .scaledToFill()
                                            .frame(width: 75, height: 75)
                                            .clipped()
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 75, height: 75)
                                    }
                                } else {
                                    Image("SmallPlant2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 75, height: 75)
                                }
                            }
                                .cornerRadius(15)
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 0)
                        )
                    }
                }
            }
            .padding()

        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList(plants: mock_plants.map { plant in
            return PlantUI(id: plant.id, name: plant.name, location: plant.location, image: plant.image, hasImage: plant.image.count > 0)
        })
    }
}
