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
//fileprivate
public
let sizeFactor = CGSize(width: UIScreen.main.bounds.size.width / 390,
                        height: UIScreen.main.bounds.size.height / 844)

// Protea
public
struct NavigationBarTittleLimelightFont: ViewModifier {
    public
    static let size: CGFloat = .largeTitle * sizeFactor.width
    let alignment: TextAlignment
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(alignment)
            .font(Font.custom("Limelight-Regular",
                              size: Self.size))
            .bold()
    }
}
public
extension View {
    func navigationBarTittleLimelightFont(alignment: TextAlignment = .center)
    -> some View {
        modifier(NavigationBarTittleLimelightFont(alignment: alignment))
    }
}

public
struct BackgroundTitleLimelightFont: ViewModifier {
    public
    static let size: CGFloat = .largeTitle * 1.6 * sizeFactor.width
    let alignment: TextAlignment
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(alignment)
            .font(Font.custom("Limelight-Regular",
                              size: Self.size))
            .bold()
    }
}
public
extension View {
    func backgroundTitleLimelightFont(alignment: TextAlignment = .center)
    -> some View {
        modifier(BackgroundTitleLimelightFont(alignment: alignment))
    }
}

public
struct ButtonTitleJosefinSansFont: ViewModifier {
    private static let size: CGFloat = .title3 * sizeFactor.width
    public
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(Font.custom("JosefinSans-Medium",
                              size: Self.size))
    }
}
public
extension View {
    func buttonTitleJosefinSansFont() -> some View {
        modifier(ButtonTitleJosefinSansFont())
    }
}

// Legacy Utils - Sep 12, 2023

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
            Text("Limelight Font")
                .backgroundTitleLimelightFont()
                .padding()
            Text("Josefin Sans")
                .buttonTitleJosefinSansFont()
                .padding()
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
