//
//  ScreenBackround.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 4/27/23.
//

import SwiftUI

struct SSOBackround: View {
    public
    var body: some View {
            Image("SSOBackground")
                .resizable()
                .scaledToFill()
    }
}

struct SSOView_Ext_Previews: PreviewProvider {
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
