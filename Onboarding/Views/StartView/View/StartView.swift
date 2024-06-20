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
            Color(viewModel.backgroundColor)
                .animation(
                    .easeInOut(duration: 0.5),
                    value: viewModel.backgroundColor
                )
            
            /// Background image
            VStack {
                CustomTabView(
                    currentStep: $viewModel.currentStep,
                    steps: viewModel.onboardingSteps
                )
                
                IndicatorView(
                    currentStep: $viewModel.currentStep,
                    onboardingSteps: viewModel.onboardingSteps
                )
                .animation(
                    .smooth(duration: 0.7),
                    value: viewModel.currentStep
                )
                .padding(.leading, 10)

                HStack {
                    SkipButton()
                    
                    Spacer()
                    
                    ProgressBar()
                }
                .padding([.leading, .trailing], 10)
                .padding(.top, -16)
            }
            .padding(.top, 83)
            .padding(.bottom, 23)
        }
        /// I can't extract this to Custom Modifier. Any suggessions? pls🥺
        /// Btw swipes are working. But it's kinda hard on Emulator
        /// All you need is to click and move mouse to the left or right then release
        /// That should work!
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
    
    /// Tbh i tried to learn the difference between making @ViewBuilder
    /// methods and using Structs that conforms to :View protocol
    /// and idk in what situation i should use @ViewBuilder or a Struct
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
