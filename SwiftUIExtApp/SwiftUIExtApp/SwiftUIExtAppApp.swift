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
//                TabView(){
//                    ForEach(0..<4, id: \.self) { idx in
//                        Text("Title \(idx)")
//                            .font(.system(size: 200))
//                            .frame(maxWidth: .infinity)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
//                PageIndicatorProxy(title: "Page Idicator",
//                                   count: 5,
//                                   alignment: .bottom)
                ContentView()
            }
        }
    }
}

struct Previews_SwiftUIExtAppApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
