//
//  PageIndicatorItem.swift
//  
//
//  Created by Gustavo Halperin on 9/20/23.
//

import SwiftUI

public
protocol PageIndicatorItem: Equatable, Hashable, Identifiable
{
    var idx: Int { get }
    var count: Int { get }
    var width: CGFloat { get }
}

public
struct PageIndicatorItemValue: PageIndicatorItem
{
    public var idx: Int
    public var count: Int
    public var width: CGFloat
    
    public var id: Int { idx }
    public init(idx: Int,
                count: Int,
                width: CGFloat) {
        self.idx = idx
        self.count = count
        self.width = width
    }
}
