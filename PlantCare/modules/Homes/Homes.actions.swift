//
//  Homes.actions.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-16.
//

import Foundation
import ReSwift
import ReSwiftThunk

struct HomesActionSetHomes: Action {
    var homes: [HomeData]
}

struct HomesActionSetSelectedHome: Action {
    var selectedHome: String
}
