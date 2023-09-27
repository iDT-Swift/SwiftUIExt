//
//  PageIndicatorItemEnvironmentKey.swift
//  
//
//  Created by Gustavo Halperin on 9/19/23.
//

import SwiftUI

private struct PageIndicatorItemEnvironmentKey: EnvironmentKey {
    static let defaultValue: AnyHashable? = nil
}

extension EnvironmentValues {
    var pageIndicatorItemSelection: AnyHashable? {
        get { self[PageIndicatorItemEnvironmentKey.self] }
        set { self[PageIndicatorItemEnvironmentKey.self] = newValue }
    }
}

extension View {
    func pageIndicatorItemSelection(_ selection: AnyHashable?) -> some View {
        environment(\.pageIndicatorItemSelection, selection)
    }
}

