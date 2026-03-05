//
//  ProgressBar.swift
//  CausosOcultosQuixeramobim
//
//  Created by Francisco Losada on 04/03/26.
//

import SwiftUI

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
