//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct StartButton: View {
    var fontType: String
    
    var body: some View {
        if fontType == "RubikDirt" {
            NavigationLink {
                GameView()
            } label: {
                Text("Jogar")
                    .foregroundColor(.black)
                    .font(.RubikDirt(fontStyle: .title3))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.white)
                    )
            }
        } else {
            NavigationLink {
                TesteConnect()
            } label: {
                Text("Sobre")
                    .foregroundColor(.white)
                    .font(.RubikDoodleShadow(fontStyle: .title3))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    StartButton(fontType: "RubikDirt")
}
