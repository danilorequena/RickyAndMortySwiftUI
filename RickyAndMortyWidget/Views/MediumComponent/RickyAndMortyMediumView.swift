//
//  RickyAndMortyMediumView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 03/11/21.
//

import SwiftUI
import WidgetKit

struct RickyAndMortyMediumView: View {
    let url: URL?
    let name: String
    let origin: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    if let url = url, let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(16)
                    } else {
                        Image("placeholder-image")
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                        Text(origin)
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct RickyAndMortyMediumView_Previews: PreviewProvider {
    static var previews: some View {
        RickyAndMortyMediumView(
            url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            name: "Ricky Sanchez",
            origin: "Terra")
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
