//
//  ContentView.swift
//  Onboarding
//
//  Created by Paul Makey on 18.06.24.
//

import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

private let onboardingSteps = [
    OnboardingStep(image: "img1", title: "Your first car without a driver's license", description: "Goes to meet people who just got their license"),
    OnboardingStep(image: "img2", title: "test2", description: "test2"),
    OnboardingStep(image: "img3", title: "test3", description: "test3"),
    OnboardingStep(image: "img4", title: "test4", description: "test4")
]

struct ContentView: View {
    @State private var currentStep = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
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
                            } else {
                                self.currentStep = 0
                            }
                        } label: {
                            Text(currentStep < onboardingSteps.count - 1 ? "Next" : "Get started")
                                .font(.title)
                                .padding(16)
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
