//
//  SSOBackroundPreviews.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt

struct SSOBackroundPreviews: View {
    var body: some View {
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
            Image("SSOBackground", bundle: Bundle(identifier: "SwiftUIExt"))
                .resizable()
                .scaledToFill()
//            SSOBackround()
//                .ignoresSafeArea()
        }
    }
}

struct SSOBackroundPreviews_Previews: PreviewProvider {
    static var previews: some View {
        SSOBackroundPreviews()
    }
}
