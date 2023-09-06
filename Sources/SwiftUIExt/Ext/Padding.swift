//
//  Padding+Ext.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

extension Edge.Set {
    var alignment: Alignment? {
        switch self {
        case .bottom: return .bottom
        case .top: return .top
        case .leading: return .leading
        case .trailing: return .trailing
        default: return nil
        }
    }
}

public
struct Padding: ViewModifier {
    var edges: Edge.Set
    var length: CGFloat?
    var repetitions: Int
    public
    init(edges: Edge.Set = .all,
         length: CGFloat? = nil,
         repetitions: Int = 0) {
        self.edges = edges
        self.length = length
        self.repetitions = repetitions
    }
    public
    func body(content: Content) -> some View {
        if repetitions <= 0 {
            content
        } else {
            content
                .padding(edges, length)
                .modifier(Padding(edges: edges,
                                  length: length,
                                  repetitions: repetitions - 1))
        }
    }
}

public
extension View {
    func padding(_ edges: Edge.Set = .all,
                 _ length: CGFloat? = nil,
                 repetitions: Int) -> some View {
        modifier(Padding(edges: edges,
                         length: length,
                         repetitions: repetitions))
    }
    func paddingBackgroundTitle(_ edges: Edge.Set = .horizontal) -> some View {
        modifier(Padding(edges: edges,
                         repetitions: 3))
    }
    func paddingAlertTitle(_ edges: Edge.Set = .horizontal) -> some View {
        modifier(Padding(edges: edges,
                         repetitions: 2))
    }
}

public
struct Padding_Ext: View {
    public
    var body: some View {
        VStack {
            Divider()
            Text("Bottom Padding")
                .font(.system(.title))
                .padding(.bottom)
            Divider()
            Text("One Bottom Padding")
                .font(.system(.title))
                .padding(.bottom, repetitions:1)
            Divider()
            Text("Two Bottom Padding")
                .font(.system(.title))
                .padding(.bottom, repetitions:2)
            Divider()
            Text("Three Bottom Padding")
                .font(.system(.title))
                .padding(.bottom, repetitions:3)
            Divider()
        }
        
    }
}

struct Padding_Ext_Previews: PreviewProvider {
    static var previews: some View {
        Padding_Ext()
    }
}
