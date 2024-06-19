//
//  HomeView.swift
//  Onboarding
//
//  Created by Paul Makey on 20.06.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(hex: 0x95B6FF)
            
            Text("You are a clever person!")
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.black)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
