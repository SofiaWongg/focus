//
//  Timer.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import Foundation
import Observation

enum TimerState: String {
  case idle
  case running
  case paused
}

enum TimerMode: String {
  case work
  case pause
}

@available(iOS 17.0, *)
@Observable
class PTimer {
  //how many seconds left/passed
  //fraction
  //string time left
  //methods play, pause, resume, reset, skip
  //helper functions
  private var mode: TimerMode = .work
  private var state: TimerState = .idle
  
  private var durationWork: TimeInterval
  private var durationBreak: TimeInterval
  
  private var secondsPassed: Int = 0
  private var fractionPassed: Double = 0
  private var dateStarted: Date = Date.now
  private var secondsPassedBeforeParse: Int = 0
  
  
  private var timer: Timer?
  private var audio: Audio = Audio()
  
  
  init(workInSeconds: TimeInterval, breakInSeconds: TimeInterval) {
    durationWork = workInSeconds
    durationBreak = breakInSeconds
  }
  
  //MARK: Computed Properties
  var getSecondsPassed: Int {
    return secondsPassed
  }
  var getSecondsPassedString:  String {
    return formatSeconds(secondsPassed)
  }
  var getSecondsLeft: Int {
    Int(duration) - secondsPassed
  }
  var getSecondsLeftString: String {
    return formatSeconds(getSecondsLeft)
  }
  var getFractionsPassed: Double {
    return fractionPassed
  }
  var getFractionLeft: Double {
    1.0 - fractionPassed
  }
  var getState: TimerState {
    state
  }
  var getMode: TimerMode {
    mode
  }
  
  
  private var duration: TimeInterval {
    if mode == .work {
      return durationWork
    } else{
      return durationBreak
    }
  }
  
  // MARK: Public Methods
  
  func start() {
    dateStarted = Date.now
    secondsPassed = 0
    fractionPassed = 0
    state = .running
    createTimer()
  }
  
  func resume() {
    dateStarted = Date.now
    state =  .running
    createTimer()
  }
  
  func pause() {
    secondsPassedBeforeParse = secondsPassed
    state = .paused
    killTimer()
  }
  
  func reset() {
    secondsPassed = 0
    fractionPassed = 0
    secondsPassedBeforeParse = 0
    state = .idle
    killTimer()
  }
  
  func skip() {
    if self.mode == .work {
      self.mode = .pause
    } else {
      self.mode = .work
    }
  }
  
  //MARK: private methods
  private func createTimer() {
    //schedule notification
    Notification.scheduleNotification(seconds: TimeInterval(getSecondsLeft), title: "Timer Done", body: "Your timer is finished")
    //create timer
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
      self.onTick()
    }
  }
  
  private func killTimer() {
    timer?.invalidate()
    timer = nil
  }
  
  private func onTick() {
    //calculate seconds since start date
    var secondsSinceStartDate = Date.now.timeIntervalSince(self.dateStarted)
    //add secoonds since paused
    self.secondsPassed = Int(secondsSinceStartDate) + self.secondsPassedBeforeParse
    //fraction
    self.fractionPassed = TimeInterval(self.secondsPassed) / self.durationWork
    //get rid of later
    audio.play(sound: .tick)
    //done? play sound, reset, switch
    if self.getSecondsLeft == 0 {
      self.fractionPassed = 0
      self.skip()//to switch mode
      self.reset() // also resets timer
      //play ending sound
      audio.play(sound: .done)
    }
  }
  
  private func formatSeconds(_ seconds: Int) -> String {
    if seconds <= 0 {
      return "00:00"
    }
    let hh: Int = seconds / 3600
    let mm: Int = (seconds % 3600) / 60
    let ss: Int = seconds % 60
    if hh > 0 {
      return String(format: "%02d:%02d:%02d", hh, mm, ss)
    }
    else {
      return String(format: "%02d:%02d", mm, ss)
    }
  }
}
