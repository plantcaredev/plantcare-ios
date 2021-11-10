//
//  UserData.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-01.
//

import Foundation
import Auth0


class UserDataDank: ObservableObject {
    @Published var userName: String = ""
    @Published var userEmail: String = ""
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())

    var token = ""

    init() {
        guard credentialsManager.hasValid() else {
            return
        }
        postLogin()
    }


    func isLoggedIn() -> Bool {
        var isLoggedIn = true
        guard credentialsManager.hasValid() else {
            isLoggedIn = false
            return isLoggedIn
        }
        return isLoggedIn
    }

    func login() {
        Auth0
            .webAuth()
            .scope("openid profile")
            .audience(AUTH0_AUDIENCE)
            .start { result in
            switch result {
            case .failure(let error):
                print("Error loggin in: \(error)")
            case .success(let credentials):
                print("Credentials: \(credentials)")
                _ = self.credentialsManager.store(credentials: credentials)
                self.postLogin()
            }
        }
    }

    func postLogin() {
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
                switch(result) {
                case .success(let profile):
                    DispatchQueue.main.async {
                        self.userName = profile.name ?? "User"
                        self.userEmail = profile.email ?? ""
                    }
                    // register to node server
                case .failure(let error):
                    print("Error getting user info: \(error)")
                }
            }
        }
    }

    func logout() {
        Auth0
            .webAuth()
            .clearSession(federated: false) { result in
            if result {
                // Session cleared
                self.userName = ""
                self.userEmail = ""

                self.credentialsManager.revoke { error in
                    guard error == nil else {
                        // Handle error
                        print("Error: \(error!)")
                        return
                    }
                }
            }
        }
    }

}
