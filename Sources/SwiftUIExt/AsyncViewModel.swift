//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 6/14/23.
//

import SwiftUI

@MainActor
class AsyncViewModel: ObservableObject {
    @Published var isActivityActive: Bool = false
    var activityLabel: String?
    
    @Published var isAlertActive: Bool = false
    var alertTitle: String?
    var alertMessage: String?
    var alertAction: (()->Void)?
}

extension AsyncViewModel {
    func setActivity(_ label:String) {
        activityLabel = label.count > 0 ? label : nil
        resetAlert()
        isActivityActive = true
    }
    func stopActivity() {
        activityLabel = nil
        isActivityActive = false
    }
    func resetAlert() {
        self.isAlertActive = false
        self.alertTitle = ""
        self.alertMessage = ""
        self.alertAction = nil
    }
    func reset() {
        self.resetAlert()
        self.stopActivity()
    }
    func setAlert(_ title:String, message:String, action: (()->Void)? = nil) {
        self.alertTitle = title
        self.alertMessage = message
        self.alertAction = action
        stopActivity()
        self.isAlertActive = true
    }
}
private
extension AsyncViewModel {
    func postActionsError(_ title:String,
                          message:String,
                          action: (()->Void)? = nil) {
        setAlert(title, message: message, action: action)
    }
}
