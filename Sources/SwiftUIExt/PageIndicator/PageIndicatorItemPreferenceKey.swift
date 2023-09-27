//
//  PageIndicatorItemPreferenceKey.swift
//  
//
//  Created by Gustavo Halperin on 9/20/23.
//

import SwiftUI

struct PageIndicatorItemPreferenceKey<T>: PreferenceKey
where T: PageIndicatorItem
{
    static var defaultValue: [T] { [] }
    
    static func reduce(value: inout [T], nextValue: () -> [T]) {
        value.append(contentsOf: nextValue())
    }
}

struct PageIndicatorItemViewModifier<T: PageIndicatorItem>: ViewModifier {
    let page: T
    @Environment(\.pageIndicatorItemSelection) var anySelection: AnyHashable?
    
    var selection: T? {
        anySelection as? T
    }
    
    var offsetX: CGFloat {
        CGFloat(page.idx - (selection?.idx ?? 0)) * page.width
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: offsetX, y: 0)
            .preference(key: PageIndicatorItemPreferenceKey<T>.self,
                        value: [page])
    }
}


public
extension View {
    func pageIndicatorItem<T>(page: T) -> some View
    where T: PageIndicatorItem
    {
        modifier(PageIndicatorItemViewModifier(page: page))
    }
}
