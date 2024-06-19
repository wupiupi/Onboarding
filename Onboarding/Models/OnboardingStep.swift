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
            OnboardingStep(
                image: "img1",
                title: "Your first car without a driver's license",
                description: "Goes to meet people who just got their license",
                backgroundColor: Color(hex: 0xF0CF69)
            ),
            OnboardingStep(
                image: "img2",
                title: "Always there: more than 1000 cars in Tbilisi",
                description: "Our company is a leader by the number of cars in the fleet",
                backgroundColor: Color(hex: 0xB7ABFD)
            ),
            OnboardingStep(
                image: "img3",
                title: "Do not pay for parking, maintenance and gasoline",
                description: "We will pay for you, all expenses related to the car",
                backgroundColor: Color(hex: 0xEFB491)
            ),
            OnboardingStep(
                image: "img4",
                title: "29 car models: from Skoda Octavia to Porsche 911",
                description: "Choose between regular car models or exclusive ones",
                backgroundColor: Color(hex: 0x95B6FF)
            )
        ]
    }
}
