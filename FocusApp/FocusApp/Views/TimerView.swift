//
//  TimerView.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/4/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct TimerView: View {
  
  private var timer = PTimer(workInSeconds: 10, breakInSeconds: 5)
  
  @State private var displayWarning = false
  @Environment(\.scenePhase) var scenePhase
  
    var body: some View {
      VStack{
        CircleTimer(fraction: timer.getFractionsPassed, primaryText: timer.getSecondsLeftString, secondaryText: timer.getMode.rawValue)
        
        //buttond
        HStack {
          //skip
          if timer.getState == .idle && timer.getMode == .pause {
            CircleButton(icon: "forward.fill") {
              timer.skip()
            }
          }
          //start
          if timer.getState == .idle{
            CircleButton(icon: "play.fill") {
              timer.start()
            }
          }
          //resume
          else if timer.getState == .paused {
            CircleButton(icon: "play.fill") {
              timer.resume()
            }
          }
          //pause
          if timer.getState == .running {
            CircleButton(icon: "pause.fill") {
              timer.pause()
            }
          }
          //reset
          if timer.getState == .running || timer.getState == .paused {
            CircleButton(icon: "stop.fill") {
              timer.reset()
            }
          }
        }
        //warning
        if displayWarning {
          NotificationDisabledTile()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(
        RadialGradient(gradient: Gradient(colors: [Color("Light"), Color("Dark")]), center: .center, startRadius: 5, endRadius: 500))
      .onChange(of: scenePhase) {
        if scenePhase == .active {
          Notification.checkAuthorization{
            authorized in
            displayWarning = !authorized
          }
        }
      }
    }
    }


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
      if #available(iOS 17.0, *) {
        TimerView()
      } else {
        // Fallback on earlier versions
      }
    }
}
