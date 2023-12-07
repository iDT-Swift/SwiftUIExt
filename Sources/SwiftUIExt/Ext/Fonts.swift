//
//  Fonts+Ext.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

struct JosefinSansFontModifier: ViewModifier {
    enum Style: String {
        case regular = "JosefinSans-Regular"
        case medium = "JosefinSans-Medium"
        case light = "JosefinSans-Light"
        case bold = "JosefinSans-Bold"
    }

    var style: Style
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(style.rawValue, size: size))
    }
}

struct LimelightFontModifier: ViewModifier {
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom("Limelight-Regular", size: size).weight(weight))
    }
}

struct SFProFontModifier: ViewModifier {
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.system(size: size, weight: weight))
    }
}

// Extensions
extension View {
    /**
     Begin Josefin Sans modifiers */
    func josefinHeaderStyle(size: CGFloat = .title1) -> some View {
        modifier(JosefinSansFontModifier(style: .bold, size: size))
    }

    func josefinBodyStyle(size: CGFloat = .title3) -> some View {
        modifier(JosefinSansFontModifier(style: .regular, size: size))
    }

    func josefinButtonStyle(size: CGFloat = .title3) -> some View {
        modifier(JosefinSansFontModifier(style: .medium, size: size))
    }

    func josefinSubtitleStyle(size: CGFloat = .caption1) -> some View {
        modifier(JosefinSansFontModifier(style: .light, size: size))
    }

    /**
     End Josefin Sans modifiers */

    /**
     Begin Limelight modifiers */
    func limelightBodyStyle(size: CGFloat = .doubleLargeTitle) -> some View {
        modifier(LimelightFontModifier(weight: .regular, size: size))
    }

    /**
     End Limelight modifiers */

    /**
     Begin SFPro modifiers */
    func sfProSubtitleStyle(size: CGFloat = .title3) -> some View {
        modifier(SFProFontModifier(weight: .regular, size: size))
    }
    /**
     End SFPro modifiers */
}

private struct Fonts_Ext: View {
    @State private var fontsRegistered = false

    var body: some View {
        VStack {
            if fontsRegistered {
                Text("Josefin Header")
                    .josefinHeaderStyle()
                    .padding()
                Text("Josefin Body")
                    .josefinBodyStyle()
                    .padding()
                Text("Josefin Button")
                    .josefinButtonStyle()
                    .padding()
                Text("Josefin Subtitle")
                    .josefinSubtitleStyle()
                    .padding()
                Text("Limelight Body")
                    .limelightBodyStyle()
                    .padding()
                Text("SF Pro Subtitle")
                    .sfProSubtitleStyle()
                    .padding()
            } else {
                ProgressView() // Show a loader or progress indicator while registering fonts
                    .onAppear {
                        Task {
                            do {
                                try await CustomFonts.shared.registerFonts()
                                fontsRegistered = true
                            } catch {
                                print(error)
                            }
                        }
                    }
            }
        }
    }
}

struct Fonts_Ext_Previews: PreviewProvider {
    static var previews: some View {
        Fonts_Ext()
    }
}
