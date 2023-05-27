//
//  ContentView.swift
//  SwiftUIExtApp
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI
import SwiftUIExt

struct ContentView: View {
    @State var selection: String = "GREEN"
    @State private var fileURL: URL? = Bundle
        .main.url(forResource: "WelcomeBackground",
                  withExtension: "mp4")
    @ViewBuilder
    var video: some View {
        if let fileURL = fileURL {
            PlayerLooperView(fileURL:fileURL)
        } else {
            Image.SSOBackground
        }
    }
    var body: some View {
        VStack {
            TabButtonsContainerView(selection: $selection) {
                Color.green.tabScrollItem(tab: "GREEN")
                Color.clear.border(Color.white).tabScrollItem(tab: "CLEAR")
                Color.yellow.tabScrollItem(tab: "YELLOW")
            }
            .padding()
            Spacer()
            if selection != "CLEAR" {
                VStack {
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
                }
                .background(Color.gray.opacity(0.2))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            video.ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
