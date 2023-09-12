//
//  TabBarItem.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

public
protocol TabBarItem: Equatable, Hashable, Identifiable
{
    var iconName: String { get }
    var title: String { get }
    var color: Color { get }
}

public
struct TabBarItemValue: TabBarItem, Hashable
{
    public var iconName: String
    public var title: String
    public var color: Color
    
    public var id: String { title }
}

extension TabBarItemValue {
    static let home: TabBarItemValue = .init(iconName: "house",
                                        title: "House",
                                        color: .red)
    static let favorites: TabBarItemValue = .init(iconName: "heart",
                                             title: "Favorites",
                                             color: .blue)
    static let profile: TabBarItemValue = .init(iconName: "person",
                                           title: "Profile",
                                           color: .green)
    static let playroom: TabBarItemValue = .init(iconName: "heart",
                                            title: "Playroom",
                                            color: .yellow)
    public static var list: [TabBarItemValue] =
        [
            home, favorites, profile, playroom
        ]
}

