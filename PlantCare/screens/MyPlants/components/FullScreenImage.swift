//
//  FullScreenImage.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import SwiftUI

struct FullScreenImage: View {
    var imageName: String?
    var imageUrl: String?

    init(imageName: String) {
        self.imageName = imageName
        self.imageUrl = nil
    }

    init(imageUrl: String) {
        self.imageUrl = imageUrl
        self.imageName = nil
    }

    var body: some View {
        if imageName != nil {
            Image(imageName!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else if imageUrl != nil {
            AsyncImage(url: URL(string: imageUrl!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
    }
}

struct FullScreenImage_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImage(imageName: "SmallPlant1")
    }
}
