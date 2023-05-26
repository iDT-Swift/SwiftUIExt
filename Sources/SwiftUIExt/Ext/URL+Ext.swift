//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 5/25/23.
//

import SwiftUI

enum URLError: Error {
    case URLCouldNotBeLocated(forResource: String, withExtension: String?)
}
