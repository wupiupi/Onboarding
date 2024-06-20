//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Paul Makey on 19.06.24.
//

import SwiftUI

struct OnboardingView: View {
    let title: String
    let description: String
    let imageName: String
    
    var fontWeight: Font.Weight = .bold
    
    var body: some View {
        GeometryReader { proxy in
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(title)
                        .font(.system(size: 24))
                        .fontWeight(fontWeight)
                        .foregroundStyle(.white)
                    
                    Text(description)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)
                }
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 24)
//                .frame(width: proxy.size.width - 24)
                
                // MARK: -  I'm Cooked. 💀💀💀
                /// I was sitting on this task for like... 3 hours but idk
                /// how to make image look nice on the all devices (iPhone SE)
                /// maybe i should make switch case with Geometry Reader for
                /// different devices? Is it a good solution?
                Image(imageName)
                    .resizable()
                    .frame(width: proxy.size.width)
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.yellow
        
        OnboardingView(
            title: "Always there: more than\n1000 cars in Tbilisi",
            description: "Our company is a leader by the number of cars in the fleet",
            imageName: "img1"
        )
    }
}
// Your first car without a driver's license
// Goes to meet people who just got their license

// Always there: more than\n1000 cars in Tbilisi
// Our company is a leader by the number of cars in the fleet
