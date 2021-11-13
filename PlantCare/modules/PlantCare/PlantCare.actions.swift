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
    return Thunk<AppState> { dispatch, getState in
        // TODO: call API to update
        dispatch(PlantCareActionSetUserData(newName: newName, newEmail: newEmail))
    }
}

struct PlantCareActionSetLoggedInStatus: Action {
    var loggedInStatus: LoggedInStatus
    var needsOnBoarding: Bool
}

let PlantCareThunkLaunch = Thunk<AppState> { dispatch, getState in
    if AuthApi.isLoggedIn() {
        AuthApi.postLogin(dispatch: dispatch)
    } else {
        dispatch(PlantCareActionSetLoggedInStatus(loggedInStatus: .loggedOut, needsOnBoarding: false))
    }
}

let PlantCareThunkLogout = Thunk<AppState> { dispatch, getState in
    AuthApi.logout(dispatch: dispatch)
}

let PlantCareThunkLogin = Thunk<AppState> { dispatch, getState in
    AuthApi.login(dispatch: dispatch)
}
