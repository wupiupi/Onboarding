//
//  ContentView.swift
//  Onboarding
//
//  Created by Paul Makey on 18.06.24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State Properties
    @State private var currentStep = 0
    @State private var progressValue: Float = 0
    
    // MARK: - Private Properties
    private let onboardingSteps = OnboardingStep.getSteps()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background image
            TabView(selection: $currentStep) {
                ForEach(onboardingSteps.indices, id: \.self) {
                    OnboardingView(
                        title: onboardingSteps[$0].title,
                        description: onboardingSteps[$0].description,
                        imageName: onboardingSteps[$0].image,
                        backgroundColor: onboardingSteps[$0].backgroundColor
                    )
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.5), value: currentStep)
            
            VStack(alignment: .leading) {
                VStack {
                    // Indicator
                    HStack {
                        ForEach(onboardingSteps.indices, id: \.self) { it in
                            if it == currentStep {
                                Rectangle()
                                    .frame(width: 25, height: 10)
                                    .cornerRadius(10)
                                    .foregroundStyle(.white)
                                    .animation(.easeInOut(duration: 0.5), value: currentStep)
                            } else {
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.leading)
                    
                    // Buttons
                    HStack {
                        Button {
                            self.currentStep = onboardingSteps.count - 1
                            progressValue = 1
                        } label: {
                            Text("Skip")
                                .font(.system(size: 20))
                                .fontWeight(.light)
                                .padding(16)
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                        
                        Button {
                            if self.currentStep < onboardingSteps.count - 1 {
                                self.currentStep += 1
                                progressValue += 0.25
                            } else {
                                self.currentStep = 0
                                progressValue = 0.25
                            }
                        } label: {
                            CircularProgressBarView(progress: $progressValue, color: .white)
                                .frame(width: 58, height: 58)
                                .padding()
                                .onAppear {
                                    progressValue = 0.25
                                }
                        }
                        .padding(.trailing)
                    }
                }
                .padding(.leading, 6)
                .padding(.bottom, 40)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
