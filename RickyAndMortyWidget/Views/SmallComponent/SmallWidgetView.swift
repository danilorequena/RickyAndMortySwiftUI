//
//  SmallWidgetView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 01/11/21.
//

import WidgetKit
import SwiftUI

struct SmallWidgetView: View {
   var url: URL?
    var body: some View {
//        Group {
            if let url = url, let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Image("placeholder-image")
            }
//        }
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
