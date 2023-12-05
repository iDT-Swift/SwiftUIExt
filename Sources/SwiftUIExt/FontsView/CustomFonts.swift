//
//  File.swift
//
//
//  Created by Gustavo Halperin on 5/19/23.
//

import SwiftUI

public
actor CustomFonts {
    public static let shared: CustomFonts = .init()
    private init() {}
    private let Manifest = [
        ("Lato-Regular", "ttf"),
        ("PlayfairDisplay-Regular", "otf"),
        ("Limelight-Regular", "ttf"),
        ("JosefinSans-Medium", "ttf")
    ]
    public nonisolated
    var fonst: [(String, String)] { Manifest }
    public func registerFonts() throws {
        do {
            try Manifest.forEach {
                try registerFont(bundle: .module,
                                 fontName: $0.0,
                                 fontExtension: $0.1)
            }
        } catch {
            throw error
        }
    }
    
    public enum FontRegistrationError: Error {
        case fontCreationFailed
        case fontRegistrationFailed(Error)
    }
    
    private func registerFont(bundle: Bundle, fontName: String, fontExtension: String) throws {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider)
        else {
            throw FontRegistrationError.fontCreationFailed
        }

        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            if let cfError = error?.takeRetainedValue() {
                // Release error as not to cause a memory leak
                error?.release()
                throw FontRegistrationError.fontRegistrationFailed(cfError)
            } else {
                error?.release()
                throw FontRegistrationError.fontRegistrationFailed(NSError(domain: "", code: 0, userInfo: nil) as Error)
            }
        }
    }
}
