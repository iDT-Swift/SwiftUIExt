//
//  PlayerLooperUIView.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import SwiftUI
import AVFoundation

// Class taken from https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/
public
class PlayerLooperUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    public
    init(fileURL: URL, frame: CGRect = .zero) {
        super.init(frame: frame)
        
        // Load Video
        let playerItem = AVPlayerItem(url: fileURL)
        
        // Setup Player
        let player = AVQueuePlayer(playerItem: playerItem)
        self.playerLayer.player = player
        self.playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(self.playerLayer)
        
        // Loop
        self.playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        // Play
        player.play()
    }
    
    public
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct PlayerLooperUIView_Previews: PreviewProvider {
    @MainActor
    struct QueuePlayerView: UIViewRepresentable {
        var fileURL: URL
        func makeUIView(context: Context) -> UIView {
            return PlayerLooperUIView(fileURL: fileURL,
                                     frame: .zero)
        }
        func updateUIView(_ uiView: UIView, context: Context) {
            // Do nothing here
        }
    }
    @MainActor
    struct Proxy: View {
        private let fileURL: URL =
        URL(string: "https://file-examples.com/storage/fe629099fc646eff79529f9/2017/04/file_example_MP4_480_1_5MG.mp4")!
        var body: some View {
            QueuePlayerView(fileURL: fileURL)
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
