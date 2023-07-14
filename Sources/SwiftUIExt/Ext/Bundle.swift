//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import SwiftUI

extension Bundle {
    func tryURL(forResource: String,
             withExtension: String?) throws -> URL {
        guard let fileURL = url(forResource: forResource,
                                withExtension: withExtension) else {
            throw URLError.URLCouldNotBeLocated(forResource: forResource,
                                                withExtension: withExtension)
        }
        return fileURL
    }
}
