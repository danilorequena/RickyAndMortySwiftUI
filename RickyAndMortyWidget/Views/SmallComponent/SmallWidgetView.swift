//
//  SmallWidgetView.swift
//  RickyAndMortySwiftUI
//
//  Created by Danilo Requena on 01/11/21.
//

import WidgetKit
import SwiftUI
import Kingfisher

struct SmallWidgetView: View {
   @State var url: URL
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
            case .failure:
                Image(systemName: "wifi.slash")
            }
        }
            
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(url: URL(string: "")!)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
