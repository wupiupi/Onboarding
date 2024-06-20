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
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text(description)
                            .font(.system(size: 20))
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                    }
                    .padding(.leading, 24)
                    
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
        title: "Always there: more than 1000 cars in Tbilisi",
        description: "Our company is a leader by the number of cars in the fleet",
        imageName: "img1",
        backgroundColor: Color(hex: 0xB7ABFD)
    )
}
