//
//  PositionedView.swift
//  ProteaVTO
//
//  Created by Gustavo Halperin on 9/14/23.
//

import SwiftUI

struct PositionedView<Content: View>: View {
    let content: Content
    var alignment: Alignment
    
    var body: some View {
        ZStack(alignment: alignment) {
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            content
        }
    }
}

struct PositionedModifier: ViewModifier {
    var alignment: Alignment
    
    func body(content: Content) -> some View {
        PositionedView(content: content, alignment: alignment)
    }
}

public
extension View {
    func positioned(alignment: Alignment) -> some View {
        self.modifier(PositionedModifier(alignment: alignment))
    }
}

struct PositionedView_Previews: PreviewProvider {
    static var previews: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 200, height: 200)
            .padding()
            .positioned(alignment: .topTrailing)
    }
}
