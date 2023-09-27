//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 5/19/23.
//

import SwiftUI

public
actor CustomFonts {
    static public let shared: CustomFonts = .init()
    private init() {}
    private let Manifest = [
        ("Lato-Regular", "ttf"),
        ("PlayfairDisplay-Regular", "otf"),
        ("Limelight-Regular", "ttf"),
        ("JosefinSans-Medium", "ttf")
    ]
    nonisolated
    public var fonst: [(String, String)] { Manifest }
    public func registerFonts() {
        Manifest.forEach {
            registerFont(bundle: .module,
                         fontName: $0.0,
                         fontExtension: $0.1)
        }
    }
    
    private func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName,
                                       withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
