//
//  ButtonsComponents.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import SwiftUI

/// Arrow button that allows user to move through the scenes
/// - Parameter sceneState: Gets the current enum case
/// - Parameter symbolDirection: Decides if its right (false) and left (true)
/// - Parameter destination: Changes the enum case
struct ArrowButton: View {
    @Binding var sceneState: Positions
    var symbolDirection: Bool
    var destination: Positions
    
    var body: some View {
        VStack{
            Button {
                sceneState = destination
                SceneManager.shared.isZoomed = false
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
