//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Halperin on 6/15/23.
//

import SwiftUI

/**
 This extension is a helper when we need to un-binding a publisher from a SwiftUI View that bind a State, ussually a boolean.
 Check this video:
 - https://www.youtube.com/watch?v=3a7tuhVpoTQ
 - Publishing changes from within view updates is not allowed, this will cause undefined behaviour
 and this comment in stack overflow https://stackoverflow.com/a/73741746 that reffers to the video but also wrote the
 code.
 */
public
extension View{
    func sync<T:Equatable>(_ published:Binding<T>,
                           with binding:Binding<T>) -> some View {
        self.onChange(of: published.wrappedValue) {
            binding.wrappedValue = $0
        }.onChange(of: binding.wrappedValue) {
            published.wrappedValue = $0
        }.onAppear {
            binding.wrappedValue = published.wrappedValue
        }
    }
}
