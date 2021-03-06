//
//  LoginScreen.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    @State var showLoginButton: Bool = false
    @State var scale: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()
            Text("PlantCare")
                .foregroundColor(.white)
                .font(.custom("Mulish-ExtraBold", size: 34))
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            Image("SmallPlant1")

            if showLoginButton {
                VStack {
                    Divider()
                        .background(.white)
                        .padding([.leading, .trailing, .top])

                    Button {
                        store.dispatch(PlantCareThunkLogin)
                    } label: {
                        Text("Login/Register")
                            .font(.custom("Mulish-Regular", size: 16))
                            .padding()
                            .foregroundColor(Color("MainDark"))
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(4)
                            .padding()
                    }
                }
                .scaleEffect(scale)
                .onAppear {
                    withAnimation {
                        scale = 1
                    }
                }
            }
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(Color("MainDark"))
        .onAppear(perform: delayAppearLoginButton)
    }

    private func delayAppearLoginButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showLoginButton = true
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
