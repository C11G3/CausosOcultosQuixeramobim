//
//  VictoryView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 27/02/26.
//

import Foundation
import SwiftUI

struct VictoryView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("capelobo foi")
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
    VictoryView()
}
