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
    let backgroundColor: Color
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(backgroundColor)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(title)
                            .font(.system(size: 28))
                            .font(.custom("Abel", fixedSize: 28))
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                        
                        Text(description)
                            .font(.system(size: 22))
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    
                    Image(imageName)
                        .resizable()
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.width + 50
                        )
                }
                .padding(.bottom, 75)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView(
        title: "Your first car without a driver's license",
        description: "Goes to meet people who just got their license",
        imageName: "img1",
        backgroundColor: Color(hex: 0xF0CF69)
    )
}
