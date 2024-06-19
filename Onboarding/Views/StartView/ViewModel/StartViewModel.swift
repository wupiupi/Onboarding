//
//  StartViewModel.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

final class StartViewModel: ObservableObject {
    @AppStorage("IS_TUTORIAL_COMPLETED") var isCompleteTutorial = false
    
    @Published var progressValue: Float = 0.25
    @Published var onboardingSteps = OnboardingStep.getSteps()
    @Published var currentStep = 0
    
    var isNotLastStep: Bool {
        currentStep != onboardingSteps.count - 1
    }
    
    var tutorialCompleted: Bool {
        currentStep == onboardingSteps.count - 1
    }
    
    func incementProgress() {
            currentStep += 1
            progressValue += 0.25
    }
    
    func decrementProgress() {
        currentStep -= 1
        progressValue -= 0.25
    }
    
    func resetProgress() {
        currentStep = 0
        progressValue = 0.25
    }
    
    func skipProgress() {
        isCompleteTutorial = true
    }
}
