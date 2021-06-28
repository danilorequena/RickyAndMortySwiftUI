//
//  ContentView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var charactersViewModel = CharactersViewModel()
    var body: some View {
        NavigationView{
            List(self.charactersViewModel.characters?.results ?? [], id: \.id) { characters in
                
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
            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
