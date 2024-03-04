//
//  AudioPlayerDemo.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/3/24.
//

import SwiftUI

struct AudioPlayerDemo: View {
  var audioPlayer =  Audio()
  
    var body: some View {
      VStack{
        Button("play done"){
          audioPlayer.play(sound: .done)
        }
        Button("play tick"){
          audioPlayer.play(sound: .tick)
        }
      }
    }
}

struct AudioPlayerDemo_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerDemo()
    }
}
