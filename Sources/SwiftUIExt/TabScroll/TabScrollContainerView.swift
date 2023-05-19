//
//  TabScrollContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/11/23.
//

import SwiftUI

/*
struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)
 */

struct TabScrollContainerView<Content>: View where Content : View {
    @State var selection: String?
    @ViewBuilder let content: Content
    @State private var tabs: [String] = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            TabScrollView(titles: tabs, selection: $selection)
            ZStack {
                content.tabScrollItemSelection(selection)
            }
        }
        .onPreferenceChange(TabScrollItemPreferenceKey.self) {
            tabs = $0
        }
    }
}

struct TabScrollContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var body: some View {
            TabScrollContainerView(selection: "RED") {
                Color.green.tabScrollItem(tab: "GREEN")
                Color.yellow.tabScrollItem(tab: "YELLOW")
                Color.red.tabScrollItem(tab: "RED")
                Color.blue.tabScrollItem(tab: "BLUE")
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
