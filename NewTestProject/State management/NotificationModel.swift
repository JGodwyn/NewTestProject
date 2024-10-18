//
//  NotificationModel.swift
//  NewTestProject
//
//  Created by Gdwn on 18/10/2024.
//

import Foundation
import SwiftUI

final class NotificationModel : ObservableObject {
    @Published var notifCount : Int = 0  // the notification count
    
    // increase notification by 1
    func increaseNotif() {
        notifCount += 1
    }
    
    // reset the notification
    func resetNotif() {
        notifCount = 0
    }
}
