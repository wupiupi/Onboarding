//
//  StartView.swift
//  Onboarding
//
//  Created by Paul Makey on 18.06.24.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject private var viewModel: StartViewModel
        
    // MARK: - Body
    var body: some View {
        ZStack {
            /// Background image
            CustomTabView(
                currentStep: $viewModel.currentStep,
                steps: viewModel.onboardingSteps
            )
            
            VStack(spacing: -10) {
                Spacer()
                /// Indicator
                IndicatorView(
                    currentStep: $viewModel.currentStep,
                    onboardingSteps: viewModel.onboardingSteps
                )
                
                /// Buttons
                HStack {
                    SkipButton()
                    
                    Spacer()
                    
                    ProgressBar()
                }
            }
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 20)
        }
        .gesture(DragGesture(minimumDistance: 2.0, coordinateSpace: .local)
            .onEnded { value in
                switch(value.translation.width, value.translation.height) {
                    // Left swipe
                    case (...0, -30...30):
                        viewModel.isNotLastStep
                        ? viewModel.incementProgress()
                        : viewModel.skipProgress()
                        
                    // Right swipe
                    case (0..., -30...30):
                        viewModel.currentStep != 0
                        ? viewModel.decrementProgress()
                        : viewModel.resetProgress()
                        
                    /// I'm using print in default case because user can swap up or down
                    /// so to avoid incorrect app work
                    default: print("no clue")
                }
            }
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder
    private func SkipButton() -> some View {
        Button {
            viewModel.skipProgress()
        } label: {
            Text("Skip")
                .font(.system(size: 20))
                .fontWeight(.light)
                .padding(16)
                .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder
    private func ProgressBar() -> some View {
        Button {
            viewModel.isNotLastStep
            ? viewModel.incementProgress()
            : viewModel.skipProgress()
        } label: {
            CircularProgressBarView(progress: $viewModel.progressValue, color: .white)
                .frame(width: 58, height: 58)
                .padding()
        }
    }
}

#Preview {
    StartView()
}
