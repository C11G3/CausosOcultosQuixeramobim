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
            VStack {
                SpriteView(scene: Victory())
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                HStack {
                    GenericButtonRubikDoodle(navigator: _navigator, route: .menu, text: "Menu")
                    
                    Spacer()
                    
                    GenericButtonRubikDirt(navigator: _navigator, route: .game, text: "Jogar Novamente")
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    VictoryView()
        .environment(ViewNavigator())
}
