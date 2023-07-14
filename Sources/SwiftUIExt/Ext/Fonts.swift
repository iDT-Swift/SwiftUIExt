//
//  Fonts+Ext.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

public
struct BackgroundTitleFont: ViewModifier {
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(Font.custom("PlayfairDisplay-Regular",
                                  size: .largeTitle))
    }
}
public
extension View {
    func backgroundTitleFont() -> some View {
        modifier(BackgroundTitleFont())
    }
}

public
struct AlertTitleFont: ViewModifier {
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(Font.custom("PlayfairDisplay-Regular",
                                  size: .title1))
    }
}
public
extension View {
    func alertTitleFont() -> some View {
        modifier(AlertTitleFont())
    }
}

public
struct ButtonTitleFont: ViewModifier {
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(Font.custom("Lato-Regular", size: .body))
    }
}
public
extension View {
    func buttonTitleFont() -> some View {
        modifier(ButtonTitleFont())
    }
}

public
struct ScreenTitle: ViewModifier {
    public
    func body(content: Content) -> some View {
        content
            .font(Font.custom("PlayfairDisplay-Regular", size: .title1))
    }
}
public
extension View {
    func screenTitle() -> some View {
        modifier(ScreenTitle())
    }
}
public
struct ScreenSubTitle: ViewModifier {
    public
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Lato-Regular", size: .footnote))
    }
}
public
extension View {
    func screenSubTitle() -> some View {
        modifier(ScreenSubTitle())
    }
}

fileprivate
struct Fonts_Ext: View {
    var body: some View {
        VStack {
            Text("backgroundTitleFont")
                .backgroundTitleFont()
                .padding()
            Text("buttonTitleFont")
                .buttonTitleFont()
                .padding()
            Text("ScreenTitle")
                .screenTitle()
                .padding()
            Text("ScreenSubTitle")
                .screenSubTitle()
                .padding()
        }
    }
}

struct Fonts_Ext_Previews: PreviewProvider {
    static var previews: some View {
        Fonts_Ext()
    }
}
