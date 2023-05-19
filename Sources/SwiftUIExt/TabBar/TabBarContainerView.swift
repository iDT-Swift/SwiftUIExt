//
//  TabBarContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI


/*
struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)
 */

struct TabBarContainerView<Content>: View where Content : View {
    @Binding var selection: TabBarItem?
    @ViewBuilder let content: Content
    @State private var tabs: [TabBarItem] = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            TabBarView(tabs: tabs,
                       selection: $selection,
                       localSelection: selection,
                       background: .white
            )
            ZStack {
                content.tabBarItemSelection(selection)
            }
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) {
            tabs = $0
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        @State private var selection: TabBarItem? = TabBarItem.allCases.first
        var body: some View {
            TabBarContainerView(selection: $selection) {
                ForEach(TabBarItem.allCases, id: \.self) {
                    $0.color.tabBarItem(tab: $0)
                }
            }
        }
    }
    static var previews: some View {
        VStack {
            Text("On top of the TabBarView")
            Proxy()
        }
        .background(Color.gray)
    }
}
