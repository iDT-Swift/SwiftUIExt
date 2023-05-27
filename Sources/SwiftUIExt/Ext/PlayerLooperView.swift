//
//  PlayerLooperView.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import SwiftUI
import AVFoundation

public
struct PlayerLooperView: UIViewRepresentable {
    var fileURL: URL
    public
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
    public
    func makeUIView(context: Context) -> UIView {
        return PlayerLooperUIView(fileURL: fileURL,
                                 frame: .zero)
    }
    public
    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing here
    }
}

struct PlayerLooperView_Previews: PreviewProvider {
    @MainActor
    struct Proxy: View {
        private let fileURL: URL =
        URL(string: "https://file-examples.com/storage/fe629099fc646eff79529f9/2017/04/file_example_MP4_480_1_5MG.mp4")!
        var body: some View {
            PlayerLooperView(fileURL: fileURL)
                .scaledToFit()
        }
    }
    static var previews: some View {
        ZStack {
            Color.gray
            Proxy().scaledToFit()
        }
        .previewDisplayName("scaledToFit")
        ZStack {
            Color.gray
            Proxy().scaledToFill()
        }
        .previewDisplayName("scaledToFill")
    }
}
