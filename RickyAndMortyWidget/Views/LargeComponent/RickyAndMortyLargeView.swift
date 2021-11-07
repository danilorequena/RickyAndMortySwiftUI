//
//  RickyAndMortyLargeView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 05/11/21.
//

import SwiftUI
import WidgetKit

struct RickyAndMortyLargeView: View {
    let infos: CharactersModel
    var body: some View {
        VStack {
            ForEach(infos.results.prefix(upTo: 3)) {
//                VStack {
                    RickyAndMortyMediumView(url: URL(string: $0.image), name: $0.name, origin: $0.origin.name)
//                }
                Divider()
            }
        }
    }
}

struct RickyAndMortyLargeView_Previews: PreviewProvider {
    static var previews: some View {
        RickyAndMortyLargeView(infos: RickyAndMortyEntry.largeStub.characters)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
