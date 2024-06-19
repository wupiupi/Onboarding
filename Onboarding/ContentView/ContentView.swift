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
                ForEach(0..<onboardingSteps.count) { it in
                    Image(onboardingSteps[it].image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.5), value: currentStep)
            
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(onboardingSteps[currentStep].title)
                        .font(.system(size: 30))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    
                    Text(onboardingSteps[currentStep].description)
                        .font(.system(size: 22))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                }
                .padding()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                VStack {
                    // Indicator
                    HStack {
                        ForEach(0..<onboardingSteps.count) { it in
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
