//
//  MenuView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct MenuView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var body: some View {
        VStack {
            Text("Causos Ocultos")
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width * 0.4)
                .font(.custom("RubikDirt-Regular", size: 65))
            
            Text("Quixeramobim")
                .foregroundStyle(.white)
                .padding(.bottom, 20)
                .font(.custom("RubikDoodleShadow-Regular", size: 35))
            
            GenericButtonRubikDirtMenu(navigator: _navigator, route: .intro, text: "Jogar")
        }
        .onAppear{
            SoundManager.instance.playSound(sound: .opening)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    MenuView()
        .environment(ViewNavigator())
}
