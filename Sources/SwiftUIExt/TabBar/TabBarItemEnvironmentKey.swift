//
//  TabBarItemEnvironmentKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

private struct TabBarItemEnvironmentKey: EnvironmentKey {
    static let defaultValue: AnyHashable? = nil
}

extension EnvironmentValues {
    var tabBarItemSelection: AnyHashable? {
        get { self[TabBarItemEnvironmentKey.self] }
        set { self[TabBarItemEnvironmentKey.self] = newValue }
    }
}

extension View {
    func tabBarItemSelection(_ selection: AnyHashable?) -> some View {
        environment(\.tabBarItemSelection, selection)
    }
}

