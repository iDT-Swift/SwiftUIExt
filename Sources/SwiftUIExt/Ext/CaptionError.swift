//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Halperin on 6/8/23.
//

import SwiftUI

public
struct CaptionError: View {
    var text: String?
    public var body: some View {
        HStack {
            HStack {
                Text(text ?? "")
                    .font(.footnote)
                    .padding(.leading)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: .title3)
            .colorCaptionErrorForeground()
            .colorCaptionErrorBackground()
            .padding(.bottom, .footnote * 0.5)
        }
        .padding(.trailing, repetitions: 4)
        .opacity(text == nil ? 0 : 1)
    }
}

struct CaptionError_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CaptionError(text:"CaptionError")
                .padding()
        }
        .ignoresSafeArea()
    }
}
