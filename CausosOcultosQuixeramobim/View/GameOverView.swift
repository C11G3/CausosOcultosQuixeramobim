//
//  GameOverView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Jonas Fernando Nascimento Melo on 27/02/26.
//

import SwiftUI

struct GameOverView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var body: some View {
        VStack {
            Text("Você foi")
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
                    .onTapGesture {
                        SceneManager.shared.isPlayerAlive = true
                        GameController.sheerd.reset()
                    }
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
