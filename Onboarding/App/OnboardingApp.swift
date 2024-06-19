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
            StartView()
                .environmentObject(viewModel)
        }
    }
}
