//
//  TabButtonsContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/12/23.
//

import SwiftUI

/*
struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)
 */

struct TabButtonsContainerView<Content>: View where Content : View {
    @State var selection: String?
    @ViewBuilder let content: Content
    @State private var tabs: [String] = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            TabButtonsView(titles: tabs, selection: $selection)
            ZStack {
                content.tabScrollItemSelection(selection)
            }
        }
        .onPreferenceChange(TabScrollItemPreferenceKey.self) {
            tabs = $0
        }
    }
}

struct TabButtonsContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var body: some View {
            TabButtonsContainerView(selection: "GREEN") {
                Color.green.tabScrollItem(tab: "GREEN")
                Color.yellow.tabScrollItem(tab: "YELLOW")
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
