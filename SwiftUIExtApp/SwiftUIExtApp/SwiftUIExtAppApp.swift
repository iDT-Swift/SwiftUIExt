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
                        do {
                            try await CustomFonts.shared.registerFonts()
                            isLoading.toggle()
                        }
                        catch {
                            print(error)
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}

struct LoadingPreviewProxy<Content>: View
where Content : View {
    @ViewBuilder let content: () -> Content
    @State var isLoading: Bool = true
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        Group {
            if isLoading {
                Text("Is loading ...")
                    .task {
                        do {
                            try await CustomFonts.shared.registerFonts()
                            isLoading.toggle()
                        }
                        catch {
                            print(error)
                        }
                    }
            } else {
                content()
            }
        }
    }
}

