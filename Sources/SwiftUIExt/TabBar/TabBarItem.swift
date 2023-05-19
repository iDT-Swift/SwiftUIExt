//
//  TabBarItem.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/10/23.
//

import SwiftUI

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
