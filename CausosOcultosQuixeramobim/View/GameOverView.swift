//
//  GameOverView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Jonas Fernando Nascimento Melo on 27/02/26.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Você foi")
                    .foregroundStyle(.white)
                    .font(.RubikDirt(fontStyle: .title2))
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                
                Text("Derrotado")
                    .foregroundStyle(.white)
                    .font(.RubikDirt(fontStyle: .title))
                    .padding(.bottom, 20)
                
                HStack {
                    GenericButtonRubikDoodle(destination: {MenuView()}, text: "Menu")
                    
                    Spacer()
                    
                    GenericButtonRubikDirt(destination: {GameView()}, text: "Jogar Novamente")
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

#Preview {
    GameOverView()
}
