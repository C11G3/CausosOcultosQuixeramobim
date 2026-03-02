//
//  MenuView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Causos Ocultos")
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                    .font((.rubikFont(fontStyle: .title3)))
                
                Text("Quixeramobim")
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                    .font((.rubikFont(fontStyle: .title3)))
                
                GenericButtonRubikDirt(destination: {GameView()},  text: "Jogar")
                GenericButtonRubikDoodle(destination: {TesteConnect()}, text: "Sobre o Jogo")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

#Preview {
    MenuView()
}
