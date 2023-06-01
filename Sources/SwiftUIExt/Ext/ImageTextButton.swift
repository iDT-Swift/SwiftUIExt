//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Halperin on 5/31/23.
//

import SwiftUI

public
struct ImageTextButton<V:View>: View  {
    var text: String
    var image: () -> V
    var action: @MainActor () -> Void
    private let padding: CGFloat = UIFont.TextStyle.body.pointSize
    public
    init(text: String, image: @escaping () -> V, action: @escaping () -> Void) {
        self.text = text
        self.image = image
        self.action = action
    }
    public var body: some View {
        ScreenButton(action: action,
                     paddingLength: 0
        ) {
            ZStack {
                HStack {
                    image()
                        .font(.system(size: .title1))
                        .padding(.leading, padding)
                    Spacer()
                }
                Text(text)
                    .padding(.vertical, padding)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: .title1) {
                ImageTextButton(text: "GMAIL") {
                    Image(systemName: "g.square")
                } action: {
                    print("GMAIL")
                }
                ImageTextButton(text: "APPLE") {
                    Image(systemName: "apple.logo")
                } action: {
                    print("APPLE")
                }
                ImageTextButton(text: "FACEBOOK") {
                    Image(systemName: "f.square.fill")
                } action: {
                    print("FACEBOOK")
                }
                ImageTextButton(text: "Email") {
                    Image(systemName: "envelope")
                } action: {
                    print("EMAIL")
                }
            }
        }
    }
}
