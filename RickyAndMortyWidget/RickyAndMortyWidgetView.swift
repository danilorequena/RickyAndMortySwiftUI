//
//  RickyAndMortyWidgetView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 11/10/21.
//

import SwiftUI
import WidgetKit

struct RickyAndMortyWidgetView: View {
    @ObservedObject private var charactersViewModel = CharactersViewModel()
    var body: some View {
        HStack {
//            List {
                ForEach(charactersViewModel.characters) { characters in
                    NavigationLink(
                        destination: DetailView(
                            image: characters.image,
                            title: characters.name,
                            subTitle: characters.species
                        )
                    ) {
                        HomeCell(
                            title: characters.name,
                            subTitle: characters.species,
                            image: characters.image
                        )
                    }
                }
//            }
            .onAppear {
                Task{
                    await charactersViewModel.getCharactersList()
                }
            }
        }
    }
    
    struct RickyAndMortyWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            RickyAndMortyWidgetView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
