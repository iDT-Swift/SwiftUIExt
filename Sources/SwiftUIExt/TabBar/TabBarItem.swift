//
//  TabBarItem.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI
/*
public
enum TabBarItem: Hashable, CaseIterable {
    case home, favorites, profile, playroom
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        case .playroom: return "heart"
        }
    }
    var title: String {
        switch self {
        case .home: return "House"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .playroom: return "Playroom"
        }
    }
    var color: Color {
        switch self {
        case .home: return .red
        case .favorites: return .blue
        case .profile: return .green
        case .playroom: return .yellow
        }
    }
}
*/

/*
public
protocol TabBarItemProtocol: Hashable, CaseIterable {
    var iconName: String { get }
    var title: String { get }
    var color: Color { get }
    static var emptyList: [any TabBarItemProtocol] { get }
}
*/
public
struct TabBarItem: Hashable {
    var iconName: String
    var title: String
    var color: Color
}

extension TabBarItem {
    static let home: TabBarItem = .init(iconName: "house",
                                        title: "House",
                                        color: .red)
    static let favorites: TabBarItem = .init(iconName: "heart",
                                             title: "Favorites",
                                             color: .blue)
    static let profile: TabBarItem = .init(iconName: "person",
                                           title: "Profile",
                                           color: .green)
    static let playroom: TabBarItem = .init(iconName: "heart",
                                            title: "Playroom",
                                            color: .yellow)
}

extension TabBarItem: CaseIterable {
    public static var allCases: [TabBarItem] = .init()
    public static var allCasesDefault: [TabBarItem] =
        [
            home, favorites, profile, playroom
        ]
}

