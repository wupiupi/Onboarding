//
//  StartViewModel.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

final class StartViewModel: ObservableObject {
    @AppStorage("IS_TUTORIAL_COMPLETED") var isCompleteTutorial = false
    
    // MARK: - Published Properties
    @Published var progressValue: Float = 0.25
    @Published var onboardingSteps = OnboardingStep.getSteps()
    @Published var currentStep = 0
    
    // MARK: - Computable Properties
    var backgroundColor: Color {
        onboardingSteps[currentStep].backgroundColor
    }
    
    /// One more question :)
    /// Should this properties (getters) be... a properties?
    /// Or better make it a function with returnable Boolean type?
    var isNotLastStep: Bool {
        currentStep != onboardingSteps.count - 1
    }
    
    var tutorialCompleted: Bool {
        currentStep == onboardingSteps.count - 1
    }
    
    // MARK: - Methods
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
