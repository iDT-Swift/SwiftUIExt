//
//  ScreenButton.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

public
struct ScreenButton<T:View>: View {
    var action: @MainActor () -> Void
    var paddingLength: CGFloat? = nil
    var label: () -> T
    var foreground: Color = .black
    var background: Color = .white
    private let textStyle: UIFont.TextStyle = .body
    public var body: some View {
        Button(action: action, label: _label)
    }
    public init(action: @escaping () -> Void,
         paddingLength: CGFloat,
         label: @escaping () -> T) {
        self.action = action
        self.paddingLength = paddingLength
        self.label = label
    }
    public init(action: @escaping () -> Void,
         label: @escaping () -> T) {
        self.action = action
        self.label = label
    }
    public init(title: String,
         foreground: Color = .black,
         background: Color = .white,
          _ action: @MainActor @escaping () -> Void
    ) where T == Text {
        self.action = action
        self.label = { Text(title) }
        self.foreground = foreground
        self.background = background
    }
    private
    func _label() -> some View {
        label()
            .font(textStyle.font)
            .fontWeight(.semibold)
            .foregroundColor(foreground)
            .frame(maxWidth: .infinity)
            .padding(paddingLength ?? textStyle.pointSize)
            .background(background, in: Capsule())
    }
}

struct ScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: .title1) {
                ScreenButton(action: { print("Hello") }) { Text("Action/Label") }
                ScreenButton(title: "Hello") { print("Title/Action") }
                ScreenButton(title: "Hello",
                             foreground: .yellow,
                             background: .green) { print("Title/Yellos/Gree/Action") }
                ScreenButton(title: "Hello") { print("Title/Action") }
            }
        }
    }
}
