//
//  ScalableButton.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 11/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI

struct StepperBasedAnimationButton: View {
    @State private var animationAmount:CGFloat = 1.0
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 0.25).repeatCount(3, autoreverses: true)
            ), in: 1...10)
            Spacer()
            CircleButton()
            .scaleEffect(animationAmount)
        }
        .padding()
    }
}
