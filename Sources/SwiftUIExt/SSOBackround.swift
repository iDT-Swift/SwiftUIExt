//
//  ScreenBackround.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/27/23.
//

import SwiftUI

extension Image {
    static public var SSOBackground:Image {
        Image("SSOBackground", bundle: .module)
    }
}

public
struct SSOBackround: View {
    public init() {}
    public
    var body: some View {
        Image.SSOBackground
                .resizable()
                .scaledToFill()
    }
}

struct SSOBackround_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack() {
                HStack {
                    SSOBackView()
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .background {
            SSOBackround()
                .ignoresSafeArea()
        }
    }
}
