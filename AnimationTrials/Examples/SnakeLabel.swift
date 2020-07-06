//
//  SnakeLabel.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 11/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI

struct SnakeLabel: View {
    var text: String
    @State private var enabled = false
    @State private var dragAmount: CGSize = .zero
    var body: some View {
        let letters = Array(text.prefix(15))
        return HStack(spacing: 0) {
            ForEach(0..<letters.count) { index in
                Text(String(letters[index]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.red : Color.blue)
                    .offset(self.dragAmount)
                    .animation(Animation
                        .easeInOut
                        .delay(Double(index)/20))
            }
        }.gesture(DragGesture()
            .onChanged { self.dragAmount = $0.translation }
            .onEnded { _ in
                self.dragAmount = .zero
                self.enabled.toggle()
            }
        )
    }
}
