//
//  NotificationDisabledTile.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

struct NotificationDisabledTile: View {
  
  
  var body: some View {
    VStack{
      Text("Notifications are disabled")
        .font(.headline)
      Text("To be notified when a period is over, enable notifications")
        .font(.subheadline)
      Button("Open Settings") {
        openSettings()
      }.buttonStyle(.bordered)
    }
    .padding()
    .background(Color("Light"))
    .foregroundColor(Color("Dark"))
    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    .frame(maxWidth: .infinity)
    .padding(.vertical)
  }
  private func openSettings() {
    DispatchQueue.main.async {
      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:])
    }
  }
}

#Preview {
  VStack{
    if #available(iOS 17.0, *) {
      NotificationDisabledTile()
    } else {
      // Fallback on earlier versions
    }
  }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("Dark"))
}
