//
//  AlertModifier.swift
//  
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI

public
struct AlertModifier<S, A, M>: ViewModifier
where  S : StringProtocol, A : View, M : View
{
    private var radius: CGFloat { isPresented == true ? 2 : 0 }
    let title: S
    @Binding var isPresented: Bool
    @ViewBuilder let actions: () -> A
    let message: () -> M
    
    public init(title: S,
                isPresented: Binding<Bool>,
                actions: @escaping () -> A,
                message: @escaping () -> M) {
        self.title = title
        self._isPresented = isPresented
        self.actions = actions
        self.message = message
    }
    public func body(content: Content) -> some View {
        content
            .blur(radius: radius)
            .alert(title,
                   isPresented: $isPresented,
                   actions: actions,
                   message: message)
    }
}

struct AlertModifier_Previews: PreviewProvider {
    static var alertError: some ViewModifier {
        AlertModifier(title: "AlertModifier Title",
                      isPresented: .constant(true),
                      actions: {
            Button("OK") { print("OK") }
        }, message: { Text(" AlertModifier Message") })
    }
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Alert Modifier").font(.title)
                Spacer()
                Text("Alert Modifier").font(.title)
                Spacer()
            }
        }
        .modifier(alertError)
        
    }
}
