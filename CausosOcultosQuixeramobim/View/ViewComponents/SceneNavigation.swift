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
        GeometryReader { geometry in
            if SceneManager.shared.isZoomed {
                ZStack{
                    SpriteView(scene: scenesCloseUp[index])
                        .onAppear{
                            scenesCloseUp[index].scaleMode = .fill
                        }
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
                    .ignoresSafeArea(.all)
                ZStack{
                    VStack{
                        Spacer()
                        HStack {
                            ArrowButton(sceneState: $currentScene, symbolDirection: true, destination: destinationLeft)
                            Spacer()
                            ArrowButton(sceneState: $currentScene, symbolDirection: false, destination: destinationRight)
                        }
                        Spacer()
                        Text("\(currentScene)")
                    }
                }
            }
        }
    }
}
