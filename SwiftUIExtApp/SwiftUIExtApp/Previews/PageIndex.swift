//
//  PageIndex.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 9/21/23.
//

import SwiftUI

struct PageIndex: View {
    @State var selectedPage = 0
    @ViewBuilder
    func formattedText(_ text: String, backgroundColor: Color, foregroundColor: Color = .black) -> some View {
        Text(text)
            .font(.largeTitle)
            .frame(width: 250, height: 250)
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(15)
    }
    var body: some View {
        TabView(selection: $selectedPage) {
            formattedText("Page #1", backgroundColor: .indigo, foregroundColor: .white).tag(0)
                .tabItem {
                    Image(systemName: "camera")
                }
            
            formattedText("Page #2", backgroundColor: .pink, foregroundColor: .white).tag(1)
                .tabItem {
                    Image(systemName: "desktopcomputer")
                        .background(Color.red)
                }
            
            formattedText("Page #3", backgroundColor: .mint).tag(2)
                .tabItem {
                    Image(systemName: "cart.fill")
                }
            
            formattedText("Page #4", backgroundColor: .yellow).tag(3)
                .tabItem {
                    Image(systemName: "paperplane.fill")
                }
            
            formattedText("Page #5", backgroundColor: .cyan).tag(4)
                .tabItem {
                    Image(systemName: "book.fill")
                }
        }
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .tint(.green)
        .toolbarBackground(.blue, for: .tabBar)
            
        /*
        TabView(){
            ForEach(0..<4, id: \.self) { idx in
                Text("Title \(idx)")
                    .font(.system(size: 200))
                    .frame(maxWidth: .infinity)
                    .tag(idx)
                    .tabItem(
                        Circle()
                            .fill(.green)
                            .frame(width: 10, height: 10)
                    )
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        */
    }
}

struct PageIndex_Previews: PreviewProvider {
    static var previews: some View {
        PageIndex()
    }
}
