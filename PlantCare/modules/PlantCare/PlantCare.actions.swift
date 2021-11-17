//
//  PlantCare.actions.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation
import ReSwift
import ReSwiftThunk

struct PlantCareActionSetUserData: Action {
    var newName: String
    var newEmail: String
}

struct PlantCareActionSetNeedsOnBoard: Action {
    var needsOnBoarding: Bool
}

struct PlantCareActionUpdateHideNavigation: Action {
    var hideNavigation: Bool
}

struct PlantCareActionSetSelectedView: Action {
    var selectedView: AvailableViews
}

func PlantCareThunkSetUserData(_ newName: String, _ newEmail: String) -> Thunk<AppState> {
    return Thunk<AppState> { dispatch, _ in
        // TODO: call API to update
        dispatch(PlantCareActionSetUserData(newName: newName, newEmail: newEmail))
    }
}

struct PlantCareActionSetLoggedInStatus: Action {
    var loggedInStatus: LoggedInStatus
    var needsOnBoarding: Bool
}

let PlantCareThunkStartApp = Thunk<AppState> { dispatch, _ in
    dispatch(HomesActionSetHomes(homes: [
        HomeData(identifier: "uuid1", name: "Eric's Home", description: "Eric and Alyssa's house", owner: "alas.eric@gmail.com", userOwnsHome: true),
        HomeData(identifier: "uuid2", name: "Parents House", description: "Alas Family house", owner: "parents@example.com", userOwnsHome: false),
    ]))
    dispatch(HomesActionSetSelectedHome(selectedHome: "uuid1"))
}

let PlantCareThunkLaunch = Thunk<AppState> { dispatch, _ in
    if AuthApi.isLoggedIn() {
        AuthApi.postLogin(dispatch: dispatch)
    } else {
        dispatch(PlantCareActionSetLoggedInStatus(loggedInStatus: .loggedOut, needsOnBoarding: false))
    }
}

let PlantCareThunkLogout = Thunk<AppState> { dispatch, _ in
    AuthApi.logout(dispatch: dispatch)
}

let PlantCareThunkLogin = Thunk<AppState> { dispatch, _ in
    AuthApi.login(dispatch: dispatch)
}
