//
//  FocusAppApp.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

@main
struct FocusAppApp: App {
    var body: some Scene {
        WindowGroup {
          if #available(iOS 17.0, *) {
            ContentView()
          } else {
            // Fallback on earlier versions
          }
        }
    }
}
