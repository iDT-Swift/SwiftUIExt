//
//  TabBarItemEnvironmentKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

private struct TabBarItemEnvironmentKey: EnvironmentKey {
    static let defaultValue: TabBarItem? = nil
}

extension EnvironmentValues {
    var tabBarItemSelection: TabBarItem? {
        get { self[TabBarItemEnvironmentKey.self] }
        set { self[TabBarItemEnvironmentKey.self] = newValue }
    }
}

extension View {
    func tabBarItemSelection(_ selection: TabBarItem?) -> some View {
        environment(\.tabBarItemSelection, selection)
    }
}
