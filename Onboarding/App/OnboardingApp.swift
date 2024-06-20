//
//  OnboardingApp.swift
//  Onboarding
//
//  Created by Paul Makey on 18.06.24.
//

import SwiftUI

@main
struct OnboardingApp: App {
    @StateObject private var viewModel = StartViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isCompleteTutorial {
                HomeView()
                    .transition(AnyTransition.scale.animation(.linear(duration: 0.3)))
            } else {
                StartView()
                    .environmentObject(viewModel)
            }
        }
    }
}
