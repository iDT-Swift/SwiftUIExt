//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 6/16/23.
//

import SwiftUI

public
extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

public
extension Color {
    enum CaptionError {
        public static var foreground: Color = .init(0xFFFFFF)
        public static var background: Color = .init(0x545454)
    }
}

// Protea colors
public
extension Color {
    static let blackPrimaryText = Color.black
    static let whitePrimaryText = Color.white
    static let buttonBgDark = Color(hex: "#2B2B2B")
    static let buttonBgGreen = Color(hex: "#50C878")
    static let buttonTextColorGreen = Color(hex: "#50C878")
    static let buttonTextColorRed = Color(hex: "#CC0000")
    static let dividerColorGreen = Color(hex: "#50C878")
    static let transparentBackground = Color.clear // For transparent backgrounds

    // Helper to convert hex to Color
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

public
extension View {
    func colorCaptionErrorForeground(color: Color = Color.CaptionError.foreground) -> some View {
        self
            .foregroundColor(color)
    }
    func colorCaptionErrorBackground(color: Color = Color.CaptionError.background) -> some View {
        self
            .background(color)
    }
}
