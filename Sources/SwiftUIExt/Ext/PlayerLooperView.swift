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
    public init(fileURL: URL) {
        self.fileURL = fileURL
    }
    public
    func makeUIView(context: Context) -> UIView {
        return QueuePlayerUIView(fileURL: fileURL,
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
        private let fileURL: URL? =
        URL(string: "https://file-examples.com/storage/fe629099fc646eff79529f9/2017/04/file_example_MP4_480_1_5MG.mp4")
        var body: some View {
            if let fileURL = fileURL {
                PlayerLooperView(fileURL: fileURL)
                    .scaledToFit()
                    
            } else {
                Text("File not found")
            }
        }
    }
    static var previews: some View {
        Proxy()
    }
}
