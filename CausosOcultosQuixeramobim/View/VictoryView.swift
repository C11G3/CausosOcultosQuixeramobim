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
//                    GenericButtonRubikDirt(destination: GameView(), backgroundColor: .white, textColor: .black, text: "Jogar Novamente")git 
                    
                    Spacer()
                    
                    NavigationLink {
                        MenuView()
                    } label: {
                        Text("Menu")
                            .foregroundColor(.black)
                            .font(.RubikDirt(fontStyle: .title3))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.white)
                            )
                    }
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
