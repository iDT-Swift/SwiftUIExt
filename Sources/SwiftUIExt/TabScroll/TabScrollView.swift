//
//  TabScrollView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

public
struct TabScrollView: View {
    let titles: [String]
    @Binding var selection: String?
    var background: Color
    public init(titles: [String],
                selection: Binding<String?> = .constant(nil),
                background: Color = .clear) {
        self.titles = titles
        self._selection = selection
        self.background = background
    }
    public
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack { ForEach(titles, id: \.self) { title in
                TabScrollItemView(title: title, active: title == selection)
                    .onTapGesture { selection = title }
            } }
        }
        .background(background)
    }
}

struct TabScrollView_Previews: PreviewProvider {
    static let titles: [String] = .init(["FIRST", "SECOND", "THIRD", "Fourth", "Fifth"])
    @MainActor
    struct Proxy: View {
        @State var selection: String? = titles.first
        var body: some View {
            TabScrollView(titles: titles,
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

