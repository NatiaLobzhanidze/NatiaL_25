//
//  LocalNotificationManager.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 29.08.22.
//

import Foundation
import UIKit
import UserNotifications

struct LocalNotificationModel {
    let id: String
    let title: String
    let message: String
}


struct LocalNotManager {
    
    static func register(notification: LocalNotificationModel, duration : Int , repeats: Bool, userInfo: [AnyHashable: Any]) {
        let userNotification = UNUserNotificationCenter.current()
        userNotification.requestAuthorization(options: [.badge, .alert]) { granted, error in
            if granted {
                print("access to notification")
                DispatchQueue.main.async {
                    addNotific(notification: notification, duration: duration, repeats: repeats, userInfo: userInfo)
                }
            }
        }
    }
    
    static func addNotific(notification: LocalNotificationModel, duration: Int, repeats: Bool, userInfo: [AnyHashable: Any]) {
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.message
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.userInfo = userInfo
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(duration), repeats: repeats)
        let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { error in
            
            guard error == nil else {
                return
            }
        }
        
    }
    
}
