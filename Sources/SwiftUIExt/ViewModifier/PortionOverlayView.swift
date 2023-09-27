//
//  PortionOverlayView.swift
//  ProteaVTO
//
//  Created by Gustavo Halperin on 9/18/23.
//

import SwiftUI

///TODO: Move PortionOverlayModifier to SwiftUIExt
struct HPortionOverlayModifier<T: View>: ViewModifier {
    var alignment: Alignment
    var divitions: Int
    var position: Int
    var overlayContent: T
    
    func body(content: Content) -> some View {
        content.overlay(alignment: alignment) {
            HStack {
                ForEach(0..<(position), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
                Rectangle()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.clear)
                    .overlay(alignment: .center) {
                        overlayContent
                    }
                ForEach(position..<(divitions), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
            }
        }
    }
}

public
extension View {
    func hPortionOverlay<Content: View>(
        alignment: Alignment,
        divitions: Int,
        position: Int,
        overlayContent: Content) -> some View {
        self.modifier(HPortionOverlayModifier(
            alignment: alignment,
            divitions: divitions,
            position: position,
            overlayContent: overlayContent) )
    }
}

public
struct VPortionOverlayModifier<T: View>: ViewModifier {
    let alignment: Alignment
    let divitions: Int
    let position: Int
    let overlayContent: T
    
    public
    init(alignment: Alignment, divitions: Int, position: Int, overlayContent: T) {
        self.alignment = alignment
        self.divitions = divitions
        self.position = position
        self.overlayContent = overlayContent
    }
    
    public
    func body(content: Content) -> some View {
        content.overlay(alignment: alignment) {
            VStack {
                ForEach(0..<(position), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
                Rectangle()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.clear)
                    .overlay(alignment: .center) {
                        overlayContent
                    }
                ForEach(position..<(divitions), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
            }
        }
    }
}

extension View {
    func vPortionOverlay<Content: View>(
        alignment: Alignment,
        divitions: Int,
        position: Int,
        overlayContent: Content) -> some View {
        self.modifier(VPortionOverlayModifier(
            alignment: alignment,
            divitions: divitions,
            position: position,
            overlayContent: overlayContent) )
    }
}

/*
public
struct PortionOverlayModifier<T: View>: ViewModifier {
    let alignment: Alignment
    let divitions: Int
    let overlayContent: T
    private var position: Int {
        switch alignment {
        case .topLeading, .top, .leading: return 0
        case . center: return divitions / 2
        case .bottom
                .overlay(alignment: .topLeading) { box(".topLeading") }
                .overlay(alignment: .top) { box(".top") }
                .overlay(alignment: .topTrailing) { box(".topTrailing") }
                .overlay(alignment: .leading) { box(".leading") }
                .overlay(alignment: .center) { box(".center") }
                .overlay(alignment: .trailing) { box(".trailing") }
                .overlay(alignment: .bottomLeading) { box(".bottomLeading") }
                .overlay(alignment: .bottom) { box(".bottom") }
                .overlay(alignment: .bottomTrailing) { box(".bottomTrailing") }
        }
    }
    
    public
    init(alignment: Alignment, divitions: Int, overlayContent: T) {
        self.alignment = alignment
        self.divitions = divitions
        self.overlayContent = overlayContent
    }
    
    public
    func body(content: Content) -> some View {
        content.overlay(alignment: alignment) {
            VStack {
                ForEach(0..<(position), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
                Rectangle()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.clear)
                    .overlay(alignment: .center) {
                        overlayContent
                    }
                ForEach(position..<(divitions), id: \.self) { _ in
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                }
            }
        }
    }
}
*/

struct PortionOverlayView: View {
    var body: some View {
        Color
            .gray
            .hPortionOverlay(alignment: .top,
                            divitions: 4,
                            position: 4,
                            overlayContent: Circle().foregroundColor(.green) )
            .hPortionOverlay(alignment: .center,
                            divitions: 5,
                            position: 0,
                            overlayContent: Circle().foregroundColor(.red) )
    }
}

struct PortionOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        PortionOverlayView()
    }
}
