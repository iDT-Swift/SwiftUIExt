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
    var alignment: Edge.Set = .top
    @Binding var selection: String
    private let content: Content
    private let onAppaerSelection: String
    @State private var tabs: [String] = .init()
    public init(
        alignment: Edge.Set,
        selection s: Binding<String>,
        @ViewBuilder content: () -> Content) {
            self.alignment = alignment
            self.content = content()
            onAppaerSelection = s.wrappedValue
            _selection = s
    }
    public var body: some View {
        ZStack(alignment: alignment.alignment ?? .top) {
            content.tabScrollItemSelection(selection)
                .padding(alignment,
                         CGFloat.largeTitle)
            TabButtonsView(titles: tabs,
                           selection: $selection)
        }
        .onPreferenceChange(TabScrollItemPreferenceKey.self) {
            tabs = $0
        }
        .onAppear {
            selection = onAppaerSelection
        }
    }
    func updateSelection(selection s:String) {
        selection = s
    }
}

struct TabButtonsContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        @State var selection: String = "GREEN"
        var body: some View {
            TabButtonsContainerView(
                alignment: .top,
                selection: $selection) {
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
