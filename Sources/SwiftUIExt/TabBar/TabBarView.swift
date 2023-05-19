//
//  TabBar.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

struct TabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem?
    @State var localSelection: TabBarItem?
    var background: Color = .white
    @Namespace private var namespace
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture { switchToTab(tab: tab) }
            }
        }
        .background(background)
        .onChange(of: selection) { value in
            withAnimation(.easeInOut) {
                localSelection = value
            }
        }
    }
}
extension TabBarView {
    private func tabView(tab: TabBarItem) -> some View {
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
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) { selection = tab }
    }
}

struct TabBarView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var body: some View {
            TabBarView(tabs: TabBarItem.allCases,
                       selection: .constant(TabBarItem.allCases.first),
                       background: .white
            )
            .background(Color.gray)
        }
    }
    static var previews: some View {
        Proxy()
    }
}
