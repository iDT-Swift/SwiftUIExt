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

public
struct TabButtonsContainerView<Content>: View where Content : View {
    @State var selection: String? = nil
    private let content: Content
    private let onAppaerSelection: String?
    @State private var tabs: [String] = .init()
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
        onAppaerSelection = nil
    }
    public init(selection s: String,
                @ViewBuilder content: () -> Content) {
        self.content = content()
        onAppaerSelection = s
    }
    public var body: some View {
        VStack(spacing: 0) {
            TabButtonsView(titles: tabs, selection: $selection)
            ZStack {
                content.tabScrollItemSelection(selection)
            }
        }
        .onPreferenceChange(TabScrollItemPreferenceKey.self) {
            tabs = $0
        }
        .onAppear {
            selection = onAppaerSelection
        }
    }
    func updateSelection(selection s:String?) {
        selection = s
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
