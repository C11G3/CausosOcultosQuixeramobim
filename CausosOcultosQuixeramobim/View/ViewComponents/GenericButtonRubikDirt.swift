//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDirt: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    var route: Routes
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.white))
            .font(.custom("RubikDirt.ttf", size: 30))
            .onTapGesture {
                navigator.clear()
                navigator.navigateTo(route)
                SceneManager.shared.isPlayerAlive = true
                GameController.sheerd.reset()
                SoundManager.instance.deleteAllSounds()
            }
    }
}
