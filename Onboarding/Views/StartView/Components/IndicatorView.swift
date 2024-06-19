//
//  IndicatorView.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

struct IndicatorView: View {
    @Binding var currentStep: Int
    let onboardingSteps: [OnboardingStep]
    
    var body: some View {
        HStack {
            ForEach(onboardingSteps.indices, id: \.self) {
                if $0 == currentStep {
                    Rectangle()
                        .frame(width: 25, height: 10)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .animation(.easeInOut(duration: 0.5), value: currentStep)
                } else {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.white.opacity(0.5))
                        .animation(.easeInOut(duration: 0.5), value: currentStep)
                }
            }
            Spacer()
        }
        .padding(.leading)
    }
}
