//
//  PageIndicatorView.swift
//  
//
//  Created by Gustavo Halperin on 9/19/23.
//

import SwiftUI

public
struct PageIndicatorView: View {
    let pages: [PageIndicatorItemValue]
    @Binding var selection: PageIndicatorItemValue
    @State var localSelection: PageIndicatorItemValue? = nil
    var color: Color
    @Namespace private var namespace
    public init(_ count:Int,
                selection: Binding<PageIndicatorItemValue>,
                color: Color = .black) {
        let count = count <= 0 ? 1 : count
        let width = UIScreen.main.bounds.width
        let pages = (0..<count)
            .map { PageIndicatorItemValue(idx: $0,
                                          count: count,
                                          width: width) }
        self.pages = pages
        self._selection = selection
        self.color = color
    }
    public var body: some View {
        HStack {
            ForEach(pages) { page in
                pageView(page: page)
                    .onTapGesture { switchToPage(page: page) }
            }
        }
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
extension PageIndicatorView {
    private func pageView(page: PageIndicatorItemValue) -> some View {
        Circle()
            .fill(color)
            .opacity(localSelection == page ? 1 : 0.4)
    }
    private func switchToPage(page: PageIndicatorItemValue) {
        withAnimation(.easeInOut) { selection = page }
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        static let count: Int = 4
        var body: some View {
            VStack {
                Spacer()
                PageIndicatorView(Proxy.count,
                                  selection:
                        .constant(PageIndicatorItemValue(idx: 0,
                                                         count: Proxy.count,
                                                         width: UIScreen.main.bounds.width)),
                                  color: .blue)
            }
        }
    }
    static var previews: some View {
        Proxy()
    }
}

