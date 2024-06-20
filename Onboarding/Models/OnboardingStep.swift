//
//  OnboardingStep.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//
import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
    let backgroundColor: Color
    
    static func getSteps() -> [OnboardingStep] {
        [
            /// Is it normal to use '\n'?
            OnboardingStep(
                image: "img1",
                title: "Your first car without\na driver's license",
                description: "Goes to meet people who just got\ntheir license",
                backgroundColor: Color(hex: 0xF0CF69)
            ),
            OnboardingStep(
                image: "img2",
                title: "Always there: more than\n1000 cars in Tbilisi",
                description: "Our company is a leader by the\nnumber of cars in the fleet",
                backgroundColor: Color(hex: 0xB7ABFD)
            ),
            OnboardingStep(
                image: "img3",
                title: "Do not pay for parking,\nmaintenance and gasoline",
                description: "We will pay for you, all expenses\nrelated to the car",
                backgroundColor: Color(hex: 0xEFB491)
            ),
            OnboardingStep(
                image: "img4",
                title: "29 car models: from Skoda\nOctavia to Porsche 911",
                description: "Choose between regular car models\nor exclusive ones",
                backgroundColor: Color(hex: 0x95B6FF)
            )
        ]
    }
}
