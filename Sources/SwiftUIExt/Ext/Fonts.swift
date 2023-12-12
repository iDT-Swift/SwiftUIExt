//
//  Fonts+Ext.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/25/23.
//

import SwiftUI

/**
 iPhone Mini Models
 - iPhone 12 Mini, iPhone 13 Mini: 1080 x 2340 pixels, 476 points per inch (PPI), 5.4-inch screen
 - Logical Resolution: 360 x 780 points
 Regular iPhone Models
 - iPhone 6, 6s, 7, 8, SE (2nd generation): 750 x 1334 pixels, 326 PPI, 4.7-inch screen
    - Logical Resolution: 375 x 667 points
 - iPhone X, XS, 11 Pro: 1125 x 2436 pixels, 458 PPI, 5.8-inch screen
    - Logical Resolution: 375 x 812 points
 - iPhone XR, 11: 828 x 1792 pixels, 326 PPI, 6.1-inch screen
    - Logical Resolution: 414 x 896 points
 - iPhone 12, 12 Pro, 13, 13 Pro: 1170 x 2532 pixels, 460 PPI, 6.1-inch screen
    - Logical Resolution: 390 x 844 points //TARGET
 Plus and Max iPhone Models
 - iPhone 6 Plus, 6s Plus, 7 Plus, 8 Plus: 1080 x 1920 pixels, 401 PPI, 5.5-inch screen
    - Logical Resolution: 414 x 736 points
 - iPhone XS Max, 11 Pro Max: 1242 x 2688 pixels, 458 PPI, 6.5-inch screen
    - Logical Resolution: 414 x 896 points
 - iPhone 12 Pro Max, 13 Pro Max: 1284 x 2778 pixels, 458 PPI, 6.7-inch screen
    - Logical Resolution: 428 x 926 points
 */

public
let sizeFactor = CGSize(width: UIScreen.main.bounds.size.width / 390,
                        height: UIScreen.main.bounds.size.height / 844)

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
        content.font(.custom(style.rawValue, size: size * sizeFactor.width))
    }
}

struct LimelightFontModifier: ViewModifier {
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom("Limelight-Regular", size: size * sizeFactor.width).weight(weight))
    }
}

struct SFProFontModifier: ViewModifier {
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.system(size: size * sizeFactor.width, weight: weight))
    }
}

// Extensions
extension View {
    /**
     Begin Josefin Sans modifiers */
    public
    func josefinHeaderStyle(size: CGFloat = .title1) -> some View {
        modifier(JosefinSansFontModifier(style: .bold, size: size))
    }

    public
    func josefinBodyStyle(size: CGFloat = .title3) -> some View {
        modifier(JosefinSansFontModifier(style: .regular, size: size))
    }

    public
    func josefinButtonStyle(size: CGFloat = .caption1) -> some View {
        modifier(JosefinSansFontModifier(style: .medium, size: size))
    }

    public
    func josefinSubtitleStyle(size: CGFloat = .caption1) -> some View {
        modifier(JosefinSansFontModifier(style: .light, size: size))
    }

    /**
     End Josefin Sans modifiers */

    /**
     Begin Limelight modifiers */
    public
    func limelightBodyStyle(size: CGFloat = .largeTitle) -> some View {
        modifier(LimelightFontModifier(weight: .regular, size: size))
    }

    /**
     End Limelight modifiers */

    /**
     Begin SFPro modifiers */
    public
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
