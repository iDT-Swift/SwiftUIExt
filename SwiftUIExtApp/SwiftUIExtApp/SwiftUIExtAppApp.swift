//
//  SwiftUIExtAppApp.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt

@main
struct SwiftUIExtAppApp: App {
    @State var isLoading: Bool = true
    var body: some Scene {
        WindowGroup {
            if isLoading {
                Text("Is loading ...")
                    .task {
                        await CustomFonts.shared.registerFonts()
                        isLoading = false
                    }
            } else {
                ContentView()
            }
        }
    }
}
