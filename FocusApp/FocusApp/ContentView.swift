//
//  ContentView.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
  
  
  var body: some View {
    TimerView()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      if #available(iOS 17.0, *) {
        ContentView()
      } else {
        // Fallback on earlier versions
      }
    }
}
