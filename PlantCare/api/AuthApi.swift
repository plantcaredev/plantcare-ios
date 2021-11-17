//
//  AuthApi.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Auth0
import Foundation
import ReSwift

class AuthApiClass: ObservableObject {
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())

    var token = ""

    func isLoggedIn() -> Bool {
        var isLoggedIn = true
        guard credentialsManager.hasValid() else {
            isLoggedIn = false
            return isLoggedIn
        }
        return isLoggedIn
    }

    func login(dispatch: @escaping DispatchFunction) {
        Auth0
            .webAuth()
            .scope("openid profile read:current_user")
            .audience(AUTH0_AUDIENCE)
            .start { result in
                switch result {
                case .failure(let error):
                    print("Error loggin in: \(error)")
                case .success(let credentials):
                    print("Credentials: \(credentials)")
                    _ = self.credentialsManager.store(credentials: credentials)
                    self.postLogin(dispatch: dispatch)
                }
            }
    }

    func postLogin(dispatch: @escaping DispatchFunction) {
        credentialsManager.credentials { error, credentials in
            guard error == nil, let credentials = credentials else {
                // Handle error
                print("Error getting creds: \(error!)")
                return
            }

            guard let accessToken = credentials.accessToken else {
                // Handle Error
                print("no access token available")
                return
            }

            self.token = accessToken

            Auth0
                .authentication()
                .userInfo(withAccessToken: accessToken)
                .start { result in
                    switch result {
                    case .success(let profile):
                        self.retrieveUserData(accessToken: accessToken, sub: profile.sub, dispatch: dispatch)
                    case .failure(let error):
                        print("Error getting user info: \(error)")
                    }
                }
        }
    }

    func retrieveUserData(accessToken: String, sub: String, dispatch: @escaping DispatchFunction) {
        Auth0
            .users(token: accessToken)
            .get(sub, fields: [], include: true)
            .start { result in
                switch result {
                case .success(let user):
                    let name = user["name"] as? String
                    let email = user["email"] as? String
                    self.registerUser(name: name ?? "", email: email ?? "", sub: sub, dispatch: dispatch)
                case .failure(let error):
                    print(error)
                }
            }
    }

    func registerUser(name: String, email: String, sub: String, dispatch: @escaping DispatchFunction) {
        print("calling backend API with: \(name), \(email), \(sub)")
        let needsOnBoarding = false // TODO: from backend API

        DispatchQueue.main.async {
            dispatch(PlantCareActionSetUserData(newName: name, newEmail: email))
            dispatch(PlantCareActionSetLoggedInStatus(loggedInStatus: .loggedIn, needsOnBoarding: needsOnBoarding))
            dispatch(PlantCareThunkStartApp)
        }
    }

    func logout(dispatch: @escaping DispatchFunction) {
        Auth0
            .webAuth()
            .clearSession(federated: false) { result in
                if result {
                    DispatchQueue.main.async {
                        dispatch(PlantCareActionSetLoggedInStatus(loggedInStatus: .loggedOut, needsOnBoarding: false))
                        dispatch(PlantCareActionSetUserData(newName: "", newEmail: ""))
                    }
                    self.credentialsManager.revoke { error in
                        guard error == nil else {
                            print("Error: \(error!)")
                            return
                        }
                    }
                }
            }
    }
}
