//
//  ButtonsComponents.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import SwiftUI

struct ArrowButton: View {
    @Binding var sceneState: Positions
    var symbolDirection: Bool
    var destination: Positions
    
    var body: some View {
        VStack{
            Button {
                sceneState = destination
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.blue)
                    Image(systemName: symbolDirection ? "chevron.left" : "chevron.right")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}
