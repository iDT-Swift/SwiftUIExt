//
//  TabButtonsView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/12/23.
//

import SwiftUI

public
struct TabButtonsView: View {
    let titles: [String]
    @Binding var selection: String
    var background: Color
    public init(titles: [String],
                background: Color = .clear) {
        self.titles = titles
        self._selection = .constant(titles.first ?? "")
        self.background = background
    }
    public init(titles: [String],
                selection: Binding<String>,
                background: Color = .clear) {
        self.titles = titles
        self._selection = selection
        self.background = background
    }
    public var body: some View {
        HStack {
            ForEach(titles, id: \.self) { title in
                TabScrollItemView(title: title, active: title == selection)
                    .onTapGesture { selection = title }
            }
            Spacer()
        }
        .background(background)
    }
}

struct TabButtonsView_Previews: PreviewProvider {
    static let titles: [String] = .init(["FIRST", "SECOND", "THIRD"])
    @MainActor
    struct Proxy: View {
        @State var selection: String = titles.first ?? ""
        var body: some View {
            TabButtonsView(titles: titles,
                          selection: $selection
            )
            .background(Color.gray)
            .padding()
        }
    }
    static var previews: some View {
        VStack {
            Proxy()
            Spacer()
        }.background(Color.gray)
    }
}
