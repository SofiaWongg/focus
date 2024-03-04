//
//  HomeView.swift
//  FocusApp
//
//  Created by Sofia Wong on 3/4/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
          Image("fullroom")
          .resizable()
          .scaledToFit()
          .padding()
          Text("Time Studied: 4hrs 30min")
            .font(.system(size: 30, weight: .light, design: .rounded))
            .foregroundStyle(Color("Light"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
          RadialGradient(gradient: Gradient(colors: [Color("Light"), Color("Dark")]), center: .center, startRadius: 5, endRadius: 500))
    }
}

#Preview {
    HomeView()
}
