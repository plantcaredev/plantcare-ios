//
//  PlantDetailsContent.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-17.
//

import SwiftUI

struct PlantDetailsContent: View {
    var body: some View {
        LazyVStack(spacing: 20) {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet orci dictum quam bibendum interdum molestie sed sem. Fusce ornare ac nunc sit amet elementum. Praesent sollicitudin sed neque eu aliquam.")
                .padding()
                .padding([.leading, .trailing])
                .font(.custom("Mulish-Regular", size: 16))
                .foregroundColor(Color("MainDark"))
            ForEach(0 ..< 10) { _ in
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: 100)
                    .padding([.leading, .trailing], 20)
            }
        }
    }
}

struct PlantDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsContent()
    }
}
