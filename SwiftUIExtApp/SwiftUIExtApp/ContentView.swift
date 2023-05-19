//
//  ContentView.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
            Text("Lato-Regular: ")
            Text("1234567890")
                .font(.custom("Lato-Regular",
                              size: .title1))
                .padding()
            Text("Lato-Regular")
            Text("1234567890")
                .font(.custom("PlayfairDisplay-Regular",
                              size: .title1))
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .background {
            Image.SSOBackground
                .resizable()
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
