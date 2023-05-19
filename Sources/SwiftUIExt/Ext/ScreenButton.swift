//
//  ScreenButton.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

struct ScreenButton<T:View>: View {
    var action: @MainActor () -> Void
    var paddingLength: CGFloat? = nil
    var label: () -> T
    var foreground: Color = .black
    var background: Color = .white
    private let textStyle: UIFont.TextStyle = .body
    var body: some View {
        Button(action: action, label: _label)
    }
    init(action: @escaping () -> Void,
         paddingLength: CGFloat,
         label: @escaping () -> T) {
        self.action = action
        self.paddingLength = paddingLength
        self.label = label
    }
    init(action: @escaping () -> Void,
         label: @escaping () -> T) {
        self.action = action
        self.label = label
    }
    init(title: String,
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

enum SignUpMethod {
    case Google, Apple, Email, Phone
    var name: String {
        switch self {
        case .Google: return "GOOGLE"
        case .Apple: return "APPLE"
        case .Email: return "EMAIL #"
        case .Phone: return "PHONE"
        }
    }
    var systemImage: String {
        switch self {
        case .Google: return "g.square"
        case .Apple: return "apple.logo"
        case .Email: return "envelope"
        case .Phone: return "iphone.gen3"
        }
    }
}

struct SignUpButton: View  {
    var signUpMethod: SignUpMethod
    var action: @MainActor () -> Void
    private let padding: CGFloat = UIFont.TextStyle.body.pointSize
    var body: some View {
        ScreenButton(action: action,
                     paddingLength: 0
        ) {
            ZStack {
                HStack {
                    Image(systemName: signUpMethod.systemImage)
                        .font(.system(size: .title1))
                        .padding(.leading, padding)
                    Spacer()
                }
                Text(signUpMethod.name)
                    .padding(.vertical, padding)
            }
        }
    }
}

struct ScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScreenButton(action: { print("Hello") }) { Text("Action/Label") }
                    .padding(.bottom)
                ScreenButton(title: "Hello") { print("Title/Action") }
                    .padding(.bottom)
                ScreenButton(title: "Hello",
                             foreground: .yellow,
                             background: .green) { print("Title/Yellos/Gree/Action") }
                    .padding(.bottom)
                ScreenButton(title: "Hello") { print("Title/Action") }
                    .padding(.bottom)
                SignUpButton(signUpMethod: .Google) { print("Google") }
                    .padding(.bottom)
                SignUpButton(signUpMethod: .Apple) { print("Apple") }
                    .padding(.bottom)
                SignUpButton(signUpMethod: .Phone) { print("Phone") }
                    .padding(.bottom)
                SignUpButton(signUpMethod: .Email) { print("Email") }
                    .padding(.bottom)
            }
        }

    }
}
