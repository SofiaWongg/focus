//
//  TimerDemo.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct TimerDemo: View {
  private var timer: PTimer = PTimer(workInSeconds: 10, breakInSeconds:5)
    var body: some View {
      Text("\(timer.getSecondsLeft)")
      Text(timer.getSecondsLeftString)
      Text(timer.getMode.rawValue)
      
      if timer.getState == .idle {
        Button("start") {
          timer.start()
        }
      }
      else if timer.getState == .running{
        Button("pause") {
          timer.pause()
        }
      }
        else if timer.getState == .paused {
          Button("resume") {
            timer.resume()
          }
        }
      }
    }

#Preview {
  struct PreviewWrapper: View {
      
      var body: some View {
        if #available(iOS 17.0, *) {
          TimerDemo()
        } else {
          // Fallback on earlier versions
        }
      }
  }
  return PreviewWrapper()
}
