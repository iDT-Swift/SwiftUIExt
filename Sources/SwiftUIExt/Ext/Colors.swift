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
