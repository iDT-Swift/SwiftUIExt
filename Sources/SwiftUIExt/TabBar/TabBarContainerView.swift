//
//  TabBarContainerView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

public
struct TabBarContainerView<Content,T>: View
where Content : View, T: TabBarItem
{
    var alignment: Edge.Set = .top
    var tabColor: Color = .white
    var floating: Bool = false
    @Binding var selection: T
    private let  content: Content
    private let onAppaerSelection: T
    @State private var tabs: [T] = .init()
    
    public
    init(
        alignment: Edge.Set,
        tabColor: Color,
        floating: Bool,
        selection s: Binding<T>,
        @ViewBuilder content: () -> Content) {
            self.alignment = alignment
            self.tabColor = tabColor
            self.floating = floating
            self._selection = s
            self.onAppaerSelection = s.wrappedValue
            self.content = content()
    }
    
    public
    var body: some View {
        ZStack(alignment: alignment.alignment ?? .top) {
            content.tabBarItemSelection(selection)
            TabBarView(tabs: tabs,
                       selection: $selection,
                       //localSelection: selection,
                       background: tabColor
            )
            .cornerRadius(floating ? 10 : 0)
            .padding(.horizontal, floating ? .body : 0)
            .padding(alignment, .body)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) {
            tabs = $0
        }
        .onAppear {
            selection = onAppaerSelection
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
        private let items: [TabBarItemValue]
        init(title: String,
             alignment: Edge.Set,
             tabColor: Color,
             floating: Bool = false
        ) {
            self.title = title
            self.alignment = alignment
            self.tabColor = tabColor
            self.floating = floating
            self.items = TabBarItemValue.list
            self.selection = self.items.first!
        }
        @State private var selection: TabBarItemValue
        var body: some View {
            TabBarContainerView (
                alignment: alignment,
                tabColor: tabColor,
                floating: floating,
                selection: $selection)
            {
                ForEach(self.items) {
                    innerBody(item: $0)
                        .tabBarItem(tab: $0)
                }
            }
        }
        func innerBody(item: TabBarItemValue) -> some View {
            VStack {
                Spacer()
                Text( item.title )
                    .font(.title)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image.SSOBg.resizable().ignoresSafeArea())
        }
    }
    static var previews: some View {
        Proxy(title: "Top TabBarView",
              alignment: .top,
              tabColor: Color.white.opacity(0.9))
        .previewDisplayName("Top")
        Proxy(title: "Bottom TabBarView",
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
