//
//  CircleButton.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 11/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI

struct CircleButton: View {
    var padding: CGFloat = 40
    var action: (()->())? = nil
    var body: some View {
        Button("Tap me"){
            guard let action =  self.action else {
                return
            }
            action()
        }
        .padding(padding)
        .foregroundColor(Color.white)
        .background(Color.red)
        .clipShape(Circle())
    }
    
}
