//
//  BackButton.swift
//  
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI

struct SSOBackView: View {
    var body: some View {
        Image(systemName: "chevron.backward")
            .symbolRenderingMode(.monochrome)
            .foregroundStyle(Color.black)
            .fontWeight(.bold)
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    public
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            SSOBackView()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                BackButton()
                    .padding()
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}
