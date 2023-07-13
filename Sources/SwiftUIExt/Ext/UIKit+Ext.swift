//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 6/21/23.
//

import SwiftUI

public
extension UIApplication {
    var currentKeyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
    }
    
    var rootViewController: UIViewController? {
        currentKeyWindow?.rootViewController
    }
}

public
extension ProcessInfo {
    static var isPreview: Bool {
        processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}

public
extension Bundle {
    var appVersion: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    var appBuild: String {
        object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    var appVersionBuild: String {
        let version = appVersion
        let build = appBuild
        return "v\(version)(\(build))"
    }
   
}
