//
//  Home.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct Home: View {
    @State var todoSectionSelection = 0

    var body: some View {
        VStack {
            HomeTopBanner()
                .padding()
            HStack {
                VStack(alignment: .leading) {
                    HomePicker()
                        .padding([.bottom])
                    HomeTasksTodoSection(selection: $todoSectionSelection)
                }
                Spacer()
            }
            .padding()
            Spacer()
        }

        .frame(maxWidth: .infinity)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
