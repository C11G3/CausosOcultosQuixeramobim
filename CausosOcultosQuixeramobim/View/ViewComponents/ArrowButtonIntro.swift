//
//  ArrowButtonIntro.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 03/03/26.
//

import SwiftUI

struct ArrowButtonIntro: View {
    var destination: Intro
    
    var body: some View {
        Button {
            SceneManager.shared.currentScene = destination
        } label: {
            Image("chevronRight")
                .resizable()
                .frame(width: 70, height: 70)
        }
    }
}
