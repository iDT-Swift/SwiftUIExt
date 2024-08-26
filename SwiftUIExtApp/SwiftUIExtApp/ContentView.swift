//
//  ContentView.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt


struct PageIndicatorProxy: View {
    var title: String
    var count: Int
    var alignment: Edge.Set
    var color: Color
    private let items: [PageIndicatorItemValue]
    init(title: String,
        count: Int,
         alignment: Edge.Set,
         color: Color = .black
    ) {
        self.title = title
        self.count = count
        self.alignment = alignment
        self.color = color
        let width = UIScreen.main.bounds.width
        self.items = (0..<count)
            .map { PageIndicatorItemValue(idx: $0,
                                          count: count,
                                          width: width) }
        self.selection = self.items[0]
    }
    @State private var selection: PageIndicatorItemValue
    var body: some View {
        PageIndicatorContainerView (
            alignment: alignment,
            color: color,
            selection: $selection)
        {
            ForEach(self.items) {
                innerBody(item: $0)
                    .background(.white)
                    .pageIndicatorItem(page: $0)
            }
        }
    }
    func innerBody(item: PageIndicatorItemValue) -> some View {
        VStack {
            Spacer()
            Text( "Page Indicator: \(item.idx)" )
                .font(.title)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView: View {
    @State var selection: String = "GREEN"
    @State private var fileURL: URL? = Bundle
        .main.url(forResource: "WelcomeBackground",
                  withExtension: "mp4")
    @ViewBuilder
    var video: some View {
        if let fileURL = fileURL {
            PlayerLooperView(fileURL:fileURL)
        } else {
            Image.SSOBg
        }
    }
    var body: some View {
        VStack {
            TabButtonsContainerView(
                alignment: .top,
                selection: $selection) {
                    Color.green.tabScrollItem(tab: "GREEN")
                        .padding()
                    Color.clear.border(Color.white).tabScrollItem(tab: "CLEAR")
                        .padding()
                    PageIndicatorProxy(title: "Page Indicator",
                                       count: 4,
                                       alignment: .bottom)
                        .tabScrollItem(tab: "Page Indicator")
                }
            Spacer()
            if selection != "CLEAR" {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .padding()
                    Text("Lato-Regular: ")
                    Text("1234567890")
                        .font(.custom("Lato-Regular",
                                      size: .title1))
                        .padding()
                    Text("Lato-Regular")
                    Text("1234567890")
                        .font(.custom("PlayfairDisplay-Regular",
                                      size: .title1))
                        .padding()
                }
                .background(Color.gray.opacity(0.2))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            video.ignoresSafeArea()
        }
    }
}

#Preview {
    // In order to make it work, to show some companies, I need to load the data offline.
    LoadingPreviewProxy { ContentView() }
        .previewDevice("iPhone 13 mini")
        .previewDisplayName("iPhone 13 mini")
}
