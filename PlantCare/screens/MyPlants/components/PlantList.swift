//
//  PlantList.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-09.
//

import ReSwift
import SwiftUI

struct PlantList: View {
    @State var roomSelection = 0
    @ObservedObject private var store = ObservableStore(store: plantCareStore)
    var searchingFor: String

    var body: some View {
        GeometryReader { geo in
            VStack {
                let roomToPlants = selectRoomToPlants(store.state)
                let rooms = roomToPlants.map { $0.key }
                let plantsForRooms = roomToPlants.map { $0.value }

                ScrollableTabBar(selection: $roomSelection, contentHeight: geo.size.height - 60) {
                    ForEach(0 ..< rooms.count) { roomIdx in
                        ScrollableTabBarItemCapsule(isSelected: roomSelection == roomIdx, text: rooms[roomIdx])
                    }
                } content: {
                    ForEach(plantsForRooms, id: \.self) { plants in
                        let filteredPlants = searchingFor.count > 0 ? plants.filter { $0.name.contains(searchingFor) } : plants

                        ScrollRefreshable(title: "Pull to Refresh") {
                            ForEach(filteredPlants, id: \.self) { plant in
                                ZStack {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(plant.name)
                                                .font(.custom("Mulish-ExtraBold", size: 20))
                                                .foregroundColor(.black)
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

                                    NavigationLink(destination: PlantDetails(plant: plant)) {
                                        EmptyView()
                                    }.frame(width: 0)
                                        .opacity(0)
                                }
                            }
                            .padding(5)
                        } onRefresh: {
                            store.dispatch(PlantActionFetchPlantsRequested)
                            _ = await store.waitTill(stateIs: { state in
                                !state.plants.fetchingPlants
                            })
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList(searchingFor: "")
    }
}
