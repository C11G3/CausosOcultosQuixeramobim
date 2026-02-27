//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDirt: View {
    var destination: any View
    var text: String
    
    var body: some View {
//            NavigationLink {
//                destination
//            } label: {
//                Text(text)
//                    .foregroundColor(.black)
//                    .font(.RubikDirt(fontStyle: .title3))
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 16)
//                            .foregroundStyle(.white)
//                    )
//            }
    }
}

#Preview {
    GenericButtonRubikDirt(destination: GameView(), text: "Jogar")
}
