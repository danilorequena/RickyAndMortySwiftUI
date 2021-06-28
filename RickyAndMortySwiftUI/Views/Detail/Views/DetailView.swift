//
//  DetailView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 28/06/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @State var image: String
    @State var title: String
    @State var subTitle: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: image))
                .resizable()
                .frame(width: 200, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            
            Text(title)
                .font(.title)
            Text(subTitle)
                .font(.subheadline)
        }
        .padding(.init(top: 120, leading: 80, bottom: 120, trailing: 80))
        .navigationTitle(title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "", title: "Title", subTitle: "Subtitle")
    }
}
