//
//  ListHomeView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import SwiftUI

struct ListHomeView: View {
    @ObservedObject private var charactersViewModel = CharactersViewModel()
    var body: some View {
        NavigationView {
            List {
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
                
//                if charactersViewModel.membersListFull == false {
//                    ProgressView()
//                        .onAppear {
//                            charactersViewModel.fetchCharacters()
//                        }
//                }
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            self.charactersViewModel.getCharactersList()
        }
    }
}

struct ListHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ListHomeView()
    }
}
