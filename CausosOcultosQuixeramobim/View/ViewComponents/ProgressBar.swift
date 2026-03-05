//
//  ProgressBar.swift
//  CausosOcultosQuixeramobim
//
//  Created by Francisco Losada on 04/03/26.
//

import SwiftUI

/// Component to see the cooldown of the barricade
/// - Parameter progress: Var to set the progress of the circle
/// - parameter duration: Var to set the duration of the animation
struct ProgressBar: View {
    @State var progress: Double
    
    let duration: Double = GameController.sheerd.player.barricadeCooldown
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 5, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: duration), value: progress)
        }
        .frame(width: 35, height: 35)
        .padding()
        .onAppear {
            progress = 1.0
        }
    }
}

#Preview {
    ProgressBar(progress: 0.0)
}
