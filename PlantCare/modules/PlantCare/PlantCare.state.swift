//
//  PlantCare.state.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation

enum AvailableViews {
    case home
    case plants
    case search
    case settings
}

enum LoggedInStatus {
    case loggedIn
    case loggedOut
    case unknown
}

struct PlantCareState: Hashable {
    var name: String = ""
    var email: String = ""
    var loggedInStatus: LoggedInStatus = .unknown
    var needsOnBoarding: Bool = false
    var selectedView: AvailableViews = .home
}
