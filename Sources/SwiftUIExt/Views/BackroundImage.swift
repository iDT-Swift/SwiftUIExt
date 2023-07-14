//
//  ScreenBackround.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/27/23.
//

import SwiftUI

extension Image {
    static public var SSOBg:Image {
        Image("SSOBackground", bundle: .module)
    }
}

public
struct BackroundImage: View {
    
    var image : Image
    
    public init(image: Image) {
        self.image = image
    }
    
    public
    var body: some View {
        image
            .resizable()
            .scaledToFill()
    }
}

struct BackroundImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack() {
                HStack {
                    BackView()
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .background {
            BackroundImage(image: .SSOBg)
                .ignoresSafeArea()
        }
    }
}
