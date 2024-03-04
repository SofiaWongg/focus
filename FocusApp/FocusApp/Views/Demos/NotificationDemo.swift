//
//  NotificationDemo.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

struct NotificationDemo: View {
  @State private var showWarning = false
  @Environment (\.scenePhase) var scenePhase
  
  var body: some View {
    VStack{
      Button("send notification"){
        Notification.scheduleNotification(seconds: 5, title: "Wassup lil hommie", body: "thats righ. go get im lil hommie")
      }
      if showWarning {
        VStack {
          Text("Notifications are disabled")
          Button("Enable"){
            DispatchQueue.main.async {
              UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:])          }
            
          }
        }
      }
    }.onChange(of: scenePhase) { scenePhase in
      if scenePhase == .active {
        Notification.checkAuthorization {authorized in
          showWarning = !authorized
        }
      }
    }
  }
}

struct NotificationDemo_Previews: PreviewProvider {
  static var previews: some View {
    NotificationDemo()
  }
}
