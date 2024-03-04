//
//  CircleButton.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/4/24.
//

import SwiftUI

struct CircleButton: View {
  let icon: String
  let action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label : {
      Image(systemName: icon)
        .foregroundColor(Color("Light"))
        .frame(width: 60, height: 60)
        .background(Color("Dark"))
        .clipShape(Circle())
    }
  }
}

#Preview {
  CircleButton(icon: "play.fill"){
    print("hello")
  }
}
