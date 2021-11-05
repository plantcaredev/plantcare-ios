//
//  PlantCare.state.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation

enum LoggedInStatus {
    case loggedIn
    case loggedOut
    case unknown
}
struct PlantCareState {
    var name: String = ""
    var email: String = ""
    var loggedInStatus: LoggedInStatus = .unknown
    var needsOnBoarding: Bool = false
}
