//
//  ListHomeView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 29/06/21.
//

import SwiftUI

struct ListHomeView: View {
    @ObservedObject private var charactersViewModel = CharactersViewModel()
    @State private var searchText : String = ""
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List {
                    ForEach(charactersViewModel.characters.filter {self.searchText.isEmpty ? true : $0.name.contains(self.searchText)}) { characters in
                        
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
                    
                    if charactersViewModel.listFull == true {
                        ProgressView()
                            .onAppear {
                                Task{
                                    await charactersViewModel.getCharactersList()
                                }
                            }
                    }
                }
                .navigationTitle("Characters")
            }
        }
        .onAppear {
            Task{
                await charactersViewModel.getCharactersList()
            }
        }
    }
}

struct ListHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ListHomeView()
    }
}
