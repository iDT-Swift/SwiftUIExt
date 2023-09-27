//
//  CGFloat.swift
//  
//
//  Created by Gustavo Halperin on 5/18/23.
//

import SwiftUI

public
extension UIFont.TextStyle {
    var pointSize: CGFloat { UIFont.preferredFont(forTextStyle: self).pointSize }
    var font: Font {
        switch self {
        case .largeTitle: return .largeTitle
        case .title1: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .subheadline: return .subheadline
        case .body: return .body
        case .callout: return .callout
        case .footnote: return .footnote
        case .caption1: return .caption
        case .caption2: return .caption2
        default: return .body
        }
    }
}

public
extension Int {
    var cgFloat: CGFloat { CGFloat(self) }
}

public
extension CGFloat {
    static var doubleLargeTitle: CGFloat { UIFont.TextStyle.largeTitle.pointSize * 2}
    static var largeTitle: CGFloat { UIFont.TextStyle.largeTitle.pointSize }
    static var title1: CGFloat { UIFont.TextStyle.title1.pointSize }
    static var title2: CGFloat { UIFont.TextStyle.title2.pointSize }
    static var title3: CGFloat { UIFont.TextStyle.title3.pointSize }
    static var headline: CGFloat { UIFont.TextStyle.headline.pointSize }
    static var subheadline: CGFloat { UIFont.TextStyle.subheadline.pointSize }
    static var body: CGFloat { UIFont.TextStyle.body.pointSize }
    static var callout: CGFloat { UIFont.TextStyle.callout.pointSize }
    static var footnote: CGFloat { UIFont.TextStyle.footnote.pointSize }
    static var caption1: CGFloat { UIFont.TextStyle.caption1.pointSize }
    static var caption2: CGFloat { UIFont.TextStyle.caption2.pointSize }
}

private
struct SwiftUI_CGFloat: View {
    var body: some View {
        VStack {
            Divider()
            VStack {
                Text("largeTitle").font(.system(size: .largeTitle))
                    .padding(.bottom,.caption2)
                Text("title1").font(.system(size: .title1))
                    .padding(.bottom,.caption2)
                Text("title2").font(.system(size: .title2))
                    .padding(.bottom,.caption2)
                Text("title3").font(.system(size: .title3))
            }
            Divider()
            VStack {
                Text("headline").font(.system(size: .headline))
                    .padding(.bottom,.caption2)
                Text("subheadline").font(.system(size: .subheadline))
                    .padding(.bottom,.caption2)
                Text("body").font(.system(size: .body))
            }
            Divider()
            VStack {
                Text("callout").font(.system(size: .callout))
                    .padding(.bottom,.caption2)
                Text("footnote").font(.system(size: .footnote))
                    .padding(.bottom,.caption2)
                Text("caption1").font(.system(size: .caption1))
                    .padding(.bottom,.caption2)
                Text("caption2").font(.system(size: .caption2))
                    .padding(.bottom,.caption2)
            }
            Divider()
        }
    }
}

struct SwiftUI_CGFloat_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_CGFloat()
    }
}
