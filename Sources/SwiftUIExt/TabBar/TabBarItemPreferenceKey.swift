//
//  TabBarItemPreferenceKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

struct TabBarItemPreferenceKey<T>: PreferenceKey
where T: TabBarItem
{
    static var defaultValue: [T] { [] }
    
    static func reduce(value: inout [T], nextValue: () -> [T]) {
        value.append(contentsOf: nextValue())
    }
}

struct TabBarItemViewModifier<T: TabBarItem>: ViewModifier {
    let tab: T
    @Environment(\.tabBarItemSelection) var anySelection: AnyHashable?
    
    var selection: T? {
        anySelection as? T
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(tab == selection ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferenceKey<T>.self, value: [tab])
    }
}


public
extension View {
    func tabBarItem<T>(tab: T) -> some View
    where T: TabBarItem
    {
        modifier(TabBarItemViewModifier(tab: tab))
    }
}
