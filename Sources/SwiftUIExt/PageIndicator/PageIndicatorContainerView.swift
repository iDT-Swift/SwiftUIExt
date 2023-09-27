//
//  PageIndicatorContainerView.swift
//  
//
//  Created by Gustavo Halperin on 9/19/23.
//

import SwiftUI

public
struct PageIndicatorContainerView<Content>: View
where Content : View
{
    var alignment: Edge.Set = .top
    var color: Color = .white
    @Binding var selection: PageIndicatorItemValue
    private let  content: Content
    private let onAppaerSelection: PageIndicatorItemValue
    @State private var pages: [PageIndicatorItemValue] = .init()
    
    public
    init(
        alignment: Edge.Set,
        color: Color,
        selection: Binding<PageIndicatorItemValue>,
        @ViewBuilder content: () -> Content) {
            self.alignment = alignment
            self.color = color
            self._selection = selection
            self.onAppaerSelection = selection.wrappedValue
            self.content = content()
    }
    
    public
    var body: some View {
        ZStack(alignment: alignment.alignment ?? .bottom) {
            content.pageIndicatorItemSelection(selection)
        }
        //TODO: both, the hPortionOverlay and the later padding must be standarized.
        .hPortionOverlay(alignment: .bottom,
                         divitions: 2,
                         position: 2,
                         overlayContent: PageIndicatorView(pages.count,
                                                          selection: $selection,
                                                          color: color)
                            .padding()
                            .padding(.top, .largeTitle)

        )
        .onPreferenceChange(PageIndicatorItemPreferenceKey.self) {
            pages = $0
        }
        .onAppear {
            selection = onAppaerSelection
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    if value.translation.width < 0 {
                        if selection.idx + 1 < pages.count {
                            withAnimation(.easeInOut) {
                                selection.idx += 1
                            } } }
                    if value.translation.width > 0 {
                        if selection.idx > 0 {
                            withAnimation(.easeInOut) {
                                selection.idx -= 1
                            } } } }
        )
        .defersSystemGestures(on: .vertical)
    }
}

struct PageIndicatorContainerView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        var title: String
        var alignment: Edge.Set
        var color: Color
        static let count: Int = 4
        private let items: [PageIndicatorItemValue]
        init(title: String,
             alignment: Edge.Set,
             color: Color = .black
        ) {
            self.title = title
            self.alignment = alignment
            self.color = color
            let width = UIScreen.main.bounds.width
            self.items = (0..<Proxy.count)
                .map { PageIndicatorItemValue(idx: $0,
                                              count: Proxy.count,
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
    static var previews: some View {
        Proxy(title: "Top TabBarView",
              alignment: .top)
        .previewDisplayName("Top")
        Proxy(title: "Bottom TabBarView",
              alignment: .bottom)
        .previewDisplayName("Bottom")
    }
}
