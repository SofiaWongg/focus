//
//  notification.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import Foundation
import UserNotifications

class Notification {
  
  static func checkAuthorization(completion: @escaping (Bool) -> Void) {
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.getNotificationSettings{ settings in
      switch settings.authorizationStatus{
      case .authorized:
        completion(true)
      case .notDetermined:
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) {allowed, error in
          completion(allowed)
        }
      default:
        completion(false)
      }
    }
  }
  
  static func scheduleNotification(seconds: TimeInterval, title: String, body: String) {
    let notificationCenter = UNUserNotificationCenter.current()
    //remove all notifications
    notificationCenter.removeAllDeliveredNotifications()
    notificationCenter.removeAllPendingNotificationRequests()
    //set up content
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: AudioSounds.done.rescource))
    //trigger
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
    let request = UNNotificationRequest(identifier: "my-notification", content: content, trigger: trigger)
    //add notification to the center
    notificationCenter.add(request)
    
  }
  
}
