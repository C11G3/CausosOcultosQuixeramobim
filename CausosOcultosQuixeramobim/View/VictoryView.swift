//
//  VictoryView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 27/02/26.
//

import Foundation
import SwiftUI

struct VictoryView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var body: some View {
        VStack {
            Text("capelobo foi")
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width * 0.3)
                .font((.rubikFont(fontStyle: .title3)))
            
            Text("Derrotado")
                .foregroundStyle(.white)
                .padding(.bottom, 20)
                .font((.rubikFont(fontStyle: .title3)))
            
            HStack {
                GenericButtonRubikDoodle(navigator: _navigator, route: .menu, text: "Menu")
                
                Spacer()
                
                GenericButtonRubikDirt(navigator: _navigator, route: .game, text: "Jogar Novamente")
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
