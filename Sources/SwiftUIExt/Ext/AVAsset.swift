//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import AVFoundation

public
enum AVAssetError: Error {
    case assetIsEmpty
}

public
extension AVAsset {
    static func videoResolution(forResource: String,
                                withExtension: String?) async throws -> CGSize {
        let url = try Bundle.main.tryURL(forResource: forResource,
                                         withExtension: withExtension)
        return try await videoResolution(url: url)
    }
    static func videoResolution(url:URL) async throws -> CGSize {
        return try await AVAsset(url: url).videoResolution
    }
    var videoResolution: CGSize {
        get async throws {
            let tracks: [AVAssetTrack] = try await loadTracks(withMediaType: .video)
            guard let track = tracks.first else { throw AVAssetError.assetIsEmpty }
            return try await track.load(.naturalSize)
        }
    }
}
