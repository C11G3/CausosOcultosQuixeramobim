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
                    .font(.RubikDirt(fontStyle: .title))
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                
                Text("Quixeramobim")
                    .foregroundStyle(.white)
                    .font(.RubikDirt(fontStyle: .title2))
                    .padding(.bottom, 20)
                
                StartButton(fontType: "RubikDirt")
                StartButton(fontType: "")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

#Preview {
    MenuView()
}
