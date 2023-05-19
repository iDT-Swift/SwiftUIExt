//
//  TabScrollItemView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

struct TabScrollItemView: View {
    static let defaultForeground: Color = .black
    static let defaultBackground: Color = .white
    static let activeForeground: Color = .white
    static let activeBackground: Color = .black
    
    var title: String
    var active: Bool = false
    var body: some View {
        Text(title)
            .font(textStyle.font)
            .fontWeight(.semibold)
            .foregroundColor(foreground)
            .padding(.vertical, textStyle.pointSize * 0.5)
            .padding(.horizontal, textStyle.pointSize * 2)
            .background(background, in: Capsule())
    }
    private let textStyle: UIFont.TextStyle = .caption1
    private var foreground: Color {
        active ? TabScrollItemView.activeForeground : TabScrollItemView.defaultForeground
    }
    private var background: Color {
        active ? TabScrollItemView.activeBackground : TabScrollItemView.defaultBackground
    }
}


struct TabScrollItemView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        let titles: [String] = .init(["FIRST", "SECOND", "THIRD", "Fourth", "Fifth"])
        var body: some View {
            ZStack {
                Color.gray.ignoresSafeArea()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack { ForEach(titles, id: \.self) {
                        TabScrollItemView(title: $0, active: $0 == titles.first)
                    } }
                }
            }
        }
    }
    static var previews: some View {
        Proxy()
    }
}
