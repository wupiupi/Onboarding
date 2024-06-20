//
//  CustomTabView.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentStep: Int
    let steps: [OnboardingStep]
    
    var body: some View {
        TabView(selection: $currentStep) {
            ForEach(steps.indices, id: \.self) {
                /// Just to make the first screen match the Figma design
                /// Again, this code is unnecessary. I'm just entertaining myself xD
                /// Should i fix Image problem? I guess so...
                /// And i will fs but for now i have not much time left untill deadline
                if $0 == 0 {
                    OnboardingView(
                        title: steps[$0].title,
                        description: steps[$0].description,
                        /// - I'm using .lowercased() because of some bug:
                        /// The deal is... when i'm pushing Images from Assets
                        /// their names changes to Img1 (f.e.) instead of img1
                        /// so the code didn't work properly
                        imageName: steps[$0].image.lowercased(),
                        fontWeight: .regular
                    )
                } else {
                    OnboardingView(
                        title: steps[$0].title,
                        description: steps[$0].description,
                        imageName: steps[$0].image.lowercased()
                    )
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.5), value: currentStep)
    }
}
