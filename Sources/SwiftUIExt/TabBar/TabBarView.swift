//
//  TabBar.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

public
struct TabBarView<T: TabBarItem>: View {
    let tabs: [T]
    @Binding var selection: T
    @State var localSelection: T? = nil
    var background: Color
    @Namespace private var namespace
    public init(tabs: [T],
                selection: Binding<T>,
                localSelection: T? = nil,
                background: Color = .white) {
        self.tabs = tabs
        self._selection = selection
        self.background = background
    }
    public var body: some View {
        HStack {
            ForEach(tabs) { tab in
                tabView(tab: tab)
                    .onTapGesture { switchToTab(tab: tab) }
            }
        }
        .background(background)
        .onAppear {
            localSelection = selection
        }
        .onChange(of: selection) { value in
            withAnimation(.easeInOut) {
                localSelection = value
            }
        }
    }
}
extension TabBarView {
    private func tabView(tab: T) -> some View {
        VStack {
            Image(systemName: tab.iconName).font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "TabBarView_Animation", in: namespace)
                }
            }
        )
    }
    private func switchToTab(tab: T) {
        withAnimation(.easeInOut) { selection = tab }
    }
}

struct TabBarView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var body: some View {
            VStack {
                Spacer()
                TabBarView(tabs: TabBarItemValue.list,
                           selection: .constant(TabBarItemValue.list.first!),
                           background: .white
                )
                Spacer()
            }
            .background(Image.SSOBg.resizable().ignoresSafeArea())
        }
    }
    static var previews: some View {
        Proxy()
    }
}
