//
//  CustomTabView.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentStep: Int
    let steps: [OnboardingStep]
    
    var body: some View {
        TabView(selection: $currentStep) {
            ForEach(steps.indices, id: \.self) {
                OnboardingView(
                    title: steps[$0].title,
                    description: steps[$0].description,
                    imageName: steps[$0].image,
                    backgroundColor: steps[$0].backgroundColor
                )
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.5), value: currentStep)
    }
}
