//
//  RickyAndMortyWidget.swift
//  RickyAndMortyWidget
//
//  Created by Danilo Requena on 11/10/21.
//

import WidgetKit
import SwiftUI

struct RickyAndMortyWidgetEntryView : View {
    var entry: RickyAndMortyEntry
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemSmall:
            HStack{
                SmallWidgetView(url: URL(string: entry.characters.results.first?.image ?? "")!)
            }
        case .systemMedium:
            HStack {
                Text(entry.characters.results.first?.name ?? "")
            }
        default:
            HStack {
                Text(entry.characters.results.first?.name ?? "")
            }
        }
    }
}

@main
struct RickyAndMortyWidget: Widget {
    let kind: String = "RickyAndMortyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: RickyAndMortyProvider()) { entry in
            RickyAndMortyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct RickyAndMortyWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RickyAndMortyWidgetEntryView(entry: RickyAndMortyEntry.stub)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            RickyAndMortyWidgetEntryView(entry: RickyAndMortyEntry.stub)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            RickyAndMortyWidgetEntryView(entry: RickyAndMortyEntry.stub)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
