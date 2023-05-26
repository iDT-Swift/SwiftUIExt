//
//  ContentView.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt

struct ContentView: View {
    @State private var fileURL: URL? = Bundle
        .main.url(forResource: "WelcomeBackground",
                  withExtension: "mp4")
    @ViewBuilder
    var video: some View {
        if let fileURL = fileURL {
            PlayerLooperView(fileURL:fileURL)
        } else {
            Color.yellow
        }
    }
    var body: some View {
        VStack {
            TabButtonsContainerView(selection: "GREEN") {
                Color.green.tabScrollItem(tab: "GREEN")
                video.tabScrollItem(tab: "VIDEO")
            }
            .padding()
            .padding(.top)
            .padding(.top)
            .padding(.top)
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
