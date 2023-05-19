//
//  TabScrollItemEnvironmentKey.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

private struct TabScrollItemEnvironmentKey: EnvironmentKey {
    static let defaultValue: String? = nil
}

extension EnvironmentValues {
    var tabScrollItemSelection: String? {
        get { self[TabScrollItemEnvironmentKey.self] }
        set { self[TabScrollItemEnvironmentKey.self] = newValue }
    }
}

extension View {
    func tabScrollItemSelection(_ selection: String?) -> some View {
        environment(\.tabScrollItemSelection, selection)
    }
}
