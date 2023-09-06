//
//  TabBarContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

struct TabBarContainerView<Content>: View where Content : View {
    var alignment: Edge.Set = .top
    var tabColor: Color = .white
    var floating: Bool = false
    @Binding var selection: TabBarItem?
    @ViewBuilder let content: Content
    @State private var tabs: [TabBarItem] = .init()
    
    var body: some View {
        ZStack(alignment: alignment.alignment ?? .center) {
            content.tabBarItemSelection(selection)
            TabBarView(tabs: tabs,
                       selection: $selection,
                       localSelection: selection,
                       background: tabColor
            )
            .cornerRadius(floating ? 10 : 0)
            .padding(.horizontal, floating ? .body : 0)
            .padding(alignment, floating ? .body : 0)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) {
            tabs = $0
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var title: String
        var alignment: Edge.Set
        var tabColor: Color
        var floating: Bool = false
        init(title: String,
             alignment: Edge.Set,
             tabColor: Color,
             floating: Bool = false
        ) {
            self.title = title
            self.alignment = alignment
            self.tabColor = tabColor
            self.floating = floating
            TabBarItem.allCases = TabBarItem.allCasesDefault
        }
        @State private var selection: TabBarItem? = TabBarItem.allCases.first
        var body: some View {
            VStack {
                Text(title)
                TabBarContainerView (
                    alignment: alignment,
                    tabColor: tabColor,
                    floating: floating,
                    selection: $selection) {
                    ForEach(TabBarItem.allCases, id: \.self) {
                        innerBody(item: $0)
                            .tabBarItem(tab: $0)
                    }
                }
            }
            .background(Color.gray)
        }
        func innerBody(item: TabBarItem) -> some View {
            VStack {
                Text( item.title )
                    .font(.title)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow)
        }
    }
    static var previews: some View {
        Proxy(title: "Top Floating TabBarView",
              alignment: .top,
              tabColor: Color.white.opacity(0.9))
        .previewDisplayName("Top")
        Proxy(title: "Bottom Floating TabBarView",
              alignment: .bottom,
              tabColor: Color.white.opacity(0.6))
        .previewDisplayName("Bottom")
        Proxy(title: "Top Floating TabBarView",
              alignment: .top,
              tabColor: Color.white.opacity(0.9),
              floating: true)
        .previewDisplayName("Top F")
        Proxy(title: "Bottom Floating TabBarView",
              alignment: .bottom,
              tabColor: Color.white.opacity(0.6),
              floating: true)
        .previewDisplayName("Bottom F")
    }
}
