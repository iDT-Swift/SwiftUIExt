//
//  QueuePlayerUIView.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import SwiftUI
import AVFoundation

// Class taken from https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/
class QueuePlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    init(fileURL: URL, frame: CGRect) {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

