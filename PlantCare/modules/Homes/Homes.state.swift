//
//  Homes.state.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-16.
//

import Foundation

struct HomeData: Hashable {
    var identifier: String
    var name: String
    var description: String
    var owner: String
    var userOwnsHome: Bool
}

struct HomesState: Hashable {
    var selectedHome: String = ""
    var homes: [HomeData] = []
}
