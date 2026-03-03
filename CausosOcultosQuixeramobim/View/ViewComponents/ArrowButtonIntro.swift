//
//  ArrowButtonIntro.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 03/03/26.
//

import SwiftUI

struct ArrowButtonIntro: View {
    @Binding var sceneState: Intro
    var destination: Intro
    
    var body: some View {
        Button {
            sceneState = destination
        } label: {
            Image("chevronRight")
                .resizable()
                .frame(width: 70, height: 70)
        }
    }
}
