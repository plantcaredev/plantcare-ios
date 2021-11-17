//
//  HomeTopBanner.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-17.
//

import SwiftUI

struct HomeTopBanner: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        let name = selectName(store.state)

        HStack {
            AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: 40, height: 40)
            }
            Text("Hello, \(name)!")
                .font(.custom("Mulish-Regular", size: 16))
            Spacer()
            VStack {
                Image(systemName: "bell.badge")
                    .foregroundStyle(.red, .black)
            }
            .frame(width: 40, height: 40)
            .background(.white)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
        }
    }
}

struct HomeTopBanner_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopBanner()
    }
}
