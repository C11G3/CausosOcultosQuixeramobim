//
//  MenuView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct MenuView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var body: some View {
        VStack {
            Text("Causos Ocultos")
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width * 0.3)
                .font((.rubikFont(fontStyle: .title3)))
            
            Text("Quixeramobim")
                .foregroundStyle(.white)
                .padding(.bottom, 20)
                .font((.rubikFont(fontStyle: .title3)))
            
            GenericButtonRubikDirt(navigator: _navigator, route: .game, text: "Jogar")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
