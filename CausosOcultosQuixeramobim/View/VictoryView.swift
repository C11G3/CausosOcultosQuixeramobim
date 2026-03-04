//
//  VictoryView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 27/02/26.
//

import Foundation
import SwiftUI
import SpriteKit

struct VictoryView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var body: some View {
        ZStack {
            SpriteView(scene: Victory())
                .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                .frame(height: UIScreen.main.bounds.height * 1.06)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack(spacing: UIScreen.main.bounds.width * 0.1) {
                    GenericButtonRubikDoodle(navigator: _navigator, route: .menu, text: "Menu")
                    
                    GenericButtonRubikDirt(navigator: _navigator, route: .game, text: "Jogar Novamente")
                }
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.14)
        }
    }
}

#Preview {
    VictoryView()
        .environment(ViewNavigator())
}
