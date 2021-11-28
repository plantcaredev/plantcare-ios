//
//  DetailsViewDismissButton.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-12.
//

import SwiftUI

struct DetailsViewDismissButton: View {
    var yOffset: CGFloat
    var dismiss: () -> Void

    var body: some View {
        HStack {
            Button {
               dismiss()
            } label: {
                VStack {
                    Image(systemName: "arrow.backward.circle.fill")
                        .cornerRadius(40)
                        .font(.system(size: 25))
                        .foregroundStyle(.white, Color("MainDark").opacity(0.75))
                        .offset(x: 0, y: yOffset)
                    Spacer()
                }
                    .frame(width: 75, height: 100)
            }
            Spacer()
        }
    }
}

