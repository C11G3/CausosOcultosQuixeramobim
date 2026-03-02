//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDirt<Content: View>: View {
    @ViewBuilder var destination: Content
    var text: String
    
    var body: some View {
            NavigationLink {
                destination
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text(text)
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.white))
                    .font(.custom("RubikDirt.ttf", size: 30))
            }
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GenericButtonRubikDirt(destination: {GameView()}, text: "Jogar")
}
