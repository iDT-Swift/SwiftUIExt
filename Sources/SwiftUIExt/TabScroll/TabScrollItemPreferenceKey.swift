//
//  TabScrollItemPreferenceKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

struct TabScrollItemPreferenceKey: PreferenceKey {
    static var defaultValue: [String] = .init()
    
    static func reduce(value: inout [String], nextValue: () -> [String]) {
        value.append(contentsOf: nextValue())
    }
}

struct TabScrollItemViewModifier: ViewModifier {
    let tab: String
    @Environment(\.tabScrollItemSelection) var selection: String?
    
    func body(content: Content) -> some View {
        content
            .opacity(tab == selection ? 1.0 : 0.0)
            .preference(key: TabScrollItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabScrollItem(tab: String) -> some View {
        modifier(TabScrollItemViewModifier(tab: tab))
    }
}

