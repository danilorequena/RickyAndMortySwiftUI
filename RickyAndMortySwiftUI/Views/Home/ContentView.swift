//
//  ContentView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 24/06/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject private var charactersViewModel = CharactersViewModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(charactersViewModel.characters?.results ?? []) { characters in
                    
                NavigationLink(
                    destination: DetailView(image: characters.image ?? "", title: characters.name ?? "", subTitle: characters.species ?? "")
                ) {
                    HomeCell(
                        title: characters.name ?? "",
                        subTitle: characters.species ?? "",
                        image: characters.image ?? ""
                    )
                }
            }
                
                if charactersViewModel.membersListFull == false {
                    ProgressView()
                        .onAppear {
                            charactersViewModel.fetchCharacters()
                        }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
