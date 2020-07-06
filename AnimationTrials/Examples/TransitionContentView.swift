//
//  TransitionAnimation.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 11/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        modifier(
            active: CornerRotateModifier(amount: 90, anchor: .bottomTrailing),
            identity: CornerRotateModifier(amount: 0, anchor: .bottomTrailing))
    }
}

struct TransitionContentView: View {
    enum AnimationType: String, CaseIterable {
        case plain = "Plain"
        case pivot = "Custom Pivot"
    }
    let allTransitions = AnimationType.allCases
    @State private var isShowing = false
    @State private var selectedTransitionIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTransitionIndex, label: Text("Select Transition type")) {
                ForEach( 0..<self.allTransitions.count) {
                    Text(self.allTransitions[$0].rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            VStack(spacing: 10) {
                Button("Tap Me" ) {
                    withAnimation {
                        self.isShowing.toggle()
                    }
                }
                if isShowing {
                    Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                        .transition(allTransitions[selectedTransitionIndex] == AnimationType.pivot ? .pivot : .scale)
                }
            }
        }.padding()
    }
}
