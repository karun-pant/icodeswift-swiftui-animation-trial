//
//  Rotating Button.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 11/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI

struct RotatingButton: View {
    @State var animationAmount = 0.0
    var body: some View {
        CircleButton(action: { () in
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
                
            }
        })
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 0, z: 1))
    }
}
