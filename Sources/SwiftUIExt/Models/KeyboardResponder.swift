//
//  KeyboardResponder.swift
//  
//
//  Created by Gustavo Halperin on 6/23/23.
//

import SwiftUI
import Combine

@MainActor
public
class KeyboardResponder: ObservableObject {
    @Published public private(set) var isKeyboardVisible = false
    private var cancelables: Set<AnyCancellable> = .init()

    public init() {
        /**
         As of SwiftUI 2.0 and Combine, by default, Publishers will send values on the thread that the notification
         was posted on, and therefore we don't need to use `receive(on) to ensure that sink happens
         on the main thread.`
         */
        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { _ in
                self.isKeyboardVisible = true
            }
            .store(in: &cancelables)
        
        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { _ in
                self.isKeyboardVisible = false
            }
            .store(in: &cancelables)
    }
}

