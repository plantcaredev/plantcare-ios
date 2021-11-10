//
//  InitialOnBoarding.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-05.
//

import SwiftUI
import ReSwift

struct InitialOnBoarding: View {
    var fullName: String
    var email: String

    @State var fullNameFormValue: String
    @State var emailFormValue: String

    @State private var selection = 1

    init (fullName: String, email: String) {
        self.fullName = fullName
        self.email = email
        _fullNameFormValue = State(wrappedValue: fullName)
        _emailFormValue = State(wrappedValue: email)
    }

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                Group {
                    OnboardingWelcome(tabSelection: $selection)
                }
                    .tag(1)
                Group {
                    OnboardingInfoConfirmation(name: $fullNameFormValue, email: $emailFormValue)
                }
                    .tag(2)

            }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            .ignoresSafeArea()
            .background(Color("DarkPurple"))
            .transition(.slide)
    }
}


struct InitialOnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        InitialOnBoarding(fullName: "Eric", email: "alas.eric@gmail.com")
    }
}

