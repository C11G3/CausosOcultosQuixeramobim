//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDoodle: View {
    var destination: any View
    var text: String
    
    var body: some View {
//        NavigationLink {
//            destination
//        } label: {
//            Text(text)
//                .foregroundColor(.white)
//                .font(.RubikDoodleShadow(fontStyle: .title3))
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(.white, lineWidth: 2)
//                )
//        }
    }
}

#Preview {
    GenericButtonRubikDoodle(destination: GameView(), text: "Jogar")
}
