//
//  NavigationButtons.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 24/02/26.
//

import SwiftUI
import SpriteKit

/// ScenePositions shows the current scene and navigation buttons
/// - Parameter currentScene: Gets the current enum case
/// - Parameter destinationRight: Changes the enum case of the right arrow button
/// - Parameter destinationLeft: Changes the enum case of the left arrow button
/// - Parameter scenes: Receives a SKScene list to display the scene through the SpriteView
/// - Parameter scenesCloseUp: Receives a SKScene list to display the scene close up through the SpriteView
/// - Parameter index: Receives the index for accessing the scenes or scenesCloseUp arrays
struct ScenePositions: View {
    @Binding var currentScene: Positions
    let destinationRight: Positions
    let destinationLeft: Positions
    let scenes: [SKScene]
    var scenesCloseUp: [SKScene]
    let index: Int
    
    var body: some View {
        if SceneManager.shared.isZoomed {
            ZStack {
                SpriteView(scene: scenesCloseUp[index])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.25)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Button {
                        SceneManager.shared.isZoomed = false
                    } label: {
                        Image("chevronLeft")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, 50)
                }
            }
        } else {
            ZStack {
                SpriteView(scene: scenes[index])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.087)))
                    .frame(height: UIScreen.main.bounds.height * 1)
                    .ignoresSafeArea()
                
                HStack {
                    ArrowButton(sceneState: $currentScene, symbolDirection: true, destination: destinationLeft)
                    
                    Spacer()
                    
                    ArrowButton(sceneState: $currentScene, symbolDirection: false, destination: destinationRight)
                }
                .padding(.top, 30)
            }
        }
    }
}

#Preview {
    GameView()
}
