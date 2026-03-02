//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDoodle<Content: View>: View {
    @ViewBuilder var destination: Content
    var text: String
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white, lineWidth: 2))
                .font((.rubikFont(fontStyle: .title3)))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GenericButtonRubikDoodle(destination: {GameView()}, text: "Jogar")
}
