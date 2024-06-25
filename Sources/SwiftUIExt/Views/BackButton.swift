//
//  BackButton.swift
//  
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI

public
struct BackView: View {
    @Environment(\.colorScheme) var colorScheme
    public init() {}
    public
    var body: some View {
        Image(systemName: "chevron.backward")
            .symbolRenderingMode(.monochrome)
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            .fontWeight(.bold)
    }
    
}

public
struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    public init() {}
    public
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            BackView()
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
