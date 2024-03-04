//
//  Audio.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import Foundation
import AVFoundation

enum AudioSounds{
  case done
  case tick
  
  var rescource: String {
    switch self {
    case .done:
      return "bell.wav"
    case .tick:
      return "tick.wav"
    }
  }
}


class Audio{
  private var audioPlayer: AVAudioPlayer?
  
  func play(sound: AudioSounds) {
    let path = Bundle.main.path(forResource: sound.rescource, ofType: nil)! //sure these files exist
    let url = URL(filePath: path)
    
    do{
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print(error.localizedDescription)
    }
  }
}
