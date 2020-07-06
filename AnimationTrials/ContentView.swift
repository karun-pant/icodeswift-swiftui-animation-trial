//
//  ContentView.swift
//  AnimationTrials
//
//  Created by Pant, Karun on 08/04/20.
//  Copyright © 2020 Pant, Karun. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    var examples = Example.Example.allCases
    @State var isShowing = true
    var body: some View {
        NavigationView() {
            List {
                ForEach(0..<examples.count) { index in
                    NavigationLink(
                        self.examples[index].rawValue,
                        destination: Example(example: self.examples[index]))
                }
            }.navigationBarTitle("Animation Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
