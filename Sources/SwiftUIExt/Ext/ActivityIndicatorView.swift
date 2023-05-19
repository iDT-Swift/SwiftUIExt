//
//  ActivityIndicatorView.swift
//  MyDubble
//
//  Created by Gustavo Halperin on 5/15/23.
//

import SwiftUI

public
struct ActivityIndicatorView: View {
    var label: String?
    public init(label: String? = nil) {
        self.label = label
    }
    public var body: some View {
        progressView
            .foregroundColor(.black)
            .padding(repetitions: 2)
            .background(.white).opacity(0.75)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    @ViewBuilder
    var progressView: some View {
        if let label = label {
            ProgressView(label)
        } else {
            ProgressView()
        }
    }
}

public
struct ActivityIndicator: ViewModifier {
    var isActive: Bool
    var label: String?
    public init(isActive: Bool, label: String? = nil) {
        self.isActive = isActive
        self.label = label
    }
    public
    func body(content: Content) -> some View {
        content
            .overlay {
                if isActive {
                    ActivityIndicatorView(label: label)
                } else {
                    EmptyView()
                }
            }
    }
}
public
extension View {
    func activityIndicator(isActive:Bool = true, label:String? = nil, blur: CGFloat = 5) -> some View {
        self
            .blur(radius: isActive ? blur : 0)
            .modifier(ActivityIndicator(isActive: isActive, label: label))
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                ActivityIndicatorView()
                    .padding()
                ActivityIndicatorView(label: "With Label ...")
                    .padding()
            }
        }
        .previewDisplayName("Two Alert Views")
        Image("SigninOptions")
            .resizable().scaledToFill().ignoresSafeArea()
            .activityIndicator(isActive: true, label: "Modifier", blur: 5)
            .previewDisplayName("View Modifier")
        
        Image("SigninOptions")
            .resizable().scaledToFill().ignoresSafeArea()
            .activityIndicator(isActive: false,
                               label: "isActive false",
                               blur: 5)
            .previewDisplayName("View Modifier isActive false")
    }
}
