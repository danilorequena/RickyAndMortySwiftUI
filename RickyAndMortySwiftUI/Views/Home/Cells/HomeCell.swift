//
//  HomeCell.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 27/06/21.
//

import SwiftUI

struct HomeCell: View {
    @State var title: String
    @State var subTitle: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("about")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                        Text(subTitle)
                    }.padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Spacer()
                }
                .padding()
                .border(.gray)
            }
        }
    }
}

struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell(title: "Title", subTitle: "SubTitle")
    }
}
