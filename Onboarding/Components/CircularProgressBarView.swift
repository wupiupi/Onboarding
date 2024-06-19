//
//  CircularProgressBarView.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

// TODO: - CHANGE ANIMATION METHOD
struct CircularProgressBarView: View {
    @Binding var progress: Float
    var color: Color = .white
    
    var body: some View {
        ZStack {
            
            Image("arrowIcon")
            
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.2)
                .foregroundStyle(Color.gray)
            
            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1)))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundStyle(color)
                .rotationEffect(.degrees(270))
                .animation(.easeInOut(duration: 1.0))
        }
    }
}

#Preview {
    CircularProgressBarView(progress: .constant(0.3), color: .green)
}
