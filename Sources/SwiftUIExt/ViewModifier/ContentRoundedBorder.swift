//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Halperin on 10/3/23.
//

import SwiftUI

struct ContentRoundedBorder: ViewModifier {
    var foreground: Color
    var background: Color
    var boderColor: Color?
    var maxWidth: CGFloat?
    var padding: CGFloat = .body
    func body(content: Content) -> some View {
        content
            .padding(.body)
            .frame(maxWidth: maxWidth)
            .foregroundColor(foreground)
            .background(background)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(boderColor ?? .clear, lineWidth: 1)
            )
    }
}
public
extension View {
    func contentRoundedBorder(foreground: Color,
                              background: Color,
                              borderColor: Color? = nil,
                              maxWidth: CGFloat? = nil,
                              padding: CGFloat = .body) -> some View {
        self.modifier(ContentRoundedBorder(foreground: foreground,
                                           background: background,
                                           boderColor: borderColor,
                                           maxWidth: maxWidth))
    }
}

struct ContentRoundedBorder_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            HStack {
                Text("no maxWidth")
                    .contentRoundedBorder(foreground: .black,
                                          background: .white)
                Text("maxWidth infinite")
                    .contentRoundedBorder(foreground: .black,
                                          background: .white,
                                          borderColor: .black,
                                          maxWidth: .infinity)
            }
            .padding()
        }
    }
}
