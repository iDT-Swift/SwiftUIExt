//
//  TabBarItemPreferenceKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = .init()
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value.append(contentsOf: nextValue())
    }
}

struct TabBarItemViewModifier: ViewModifier {
    let tab: TabBarItem
    @Environment(\.tabBarItemSelection) var selection: TabBarItem?
    
    func body(content: Content) -> some View {
        content
            .opacity(tab == selection ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem) -> some View {
        modifier(TabBarItemViewModifier(tab: tab))
    }
}
