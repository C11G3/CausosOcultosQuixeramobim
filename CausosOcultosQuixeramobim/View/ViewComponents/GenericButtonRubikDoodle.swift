//
//  StartButton.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

struct GenericButtonRubikDoodle: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    var route: Routes
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white, lineWidth: 2))
            .font((.rubikFont(fontStyle: .title3)))
            .onTapGesture {
                navigator.clear()
                navigator.navigateTo(route)
                SoundManager.instance.deleteAllSounds()
            }
    }
}
