//
//  NavigationButtons.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 24/02/26.
//

import SwiftUI
import SpriteKit

struct ScenePositions: View {
    @Binding var currentScene: Positions
    let destinationRight: Positions
    let destinationLeft: Positions
    let scenes: [SKScene]
    let scenesCloseUp: [SKScene]
    let index: Int
    
    var body: some View {
        if SceneManager.shared.isZoomed {
            ZStack{
                SpriteView(scene: scenesCloseUp[index])
                    .onAppear{
                        scenesCloseUp[index].scaleMode = .fill
                    }
                    .scaledToFit()
                    .overlay {
                        HStack {
                            ArrowButton(sceneState: $currentScene, symbolDirection: true, destination: destinationRight)
                            
                            Spacer()
                            
                            ArrowButton(sceneState: $currentScene, symbolDirection: false, destination: destinationLeft)
                        }
                    }
                VStack{
                    HStack{
                        Button {
                            SceneManager.shared.isZoomed = false
                        } label: {
                            Text("back")
                        }
                        Spacer()
                    }
                    Spacer()
                }

            }
        } else {
            SpriteView(scene: scenes[index])
                .onAppear{
                    scenes[index].scaleMode = .fill
                }
                .scaledToFit()
                .overlay {
                    HStack {
                        ArrowButton(sceneState: $currentScene, symbolDirection: true, destination: destinationLeft)
                        
                        Spacer()
                        
                        ArrowButton(sceneState: $currentScene, symbolDirection: false, destination: destinationRight)
                    }
                }
        }
    }
}
