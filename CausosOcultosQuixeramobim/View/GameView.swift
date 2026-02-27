//
//  ContentView.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import SwiftUI
import SpriteKit
import WatchConnectivity

/// Display the main view
/// `init:`  Scene initialization out of its array
struct GameView: View {
    @State var currentScene: Positions = .WINDOW
    var scenes: [SKScene]
    var scenesCloseUp: [SKScene]
    
    init() {
        let tempScenes:  [SKScene] = [Window(), Entrance(), Kitchen(), Shelf()]
        for i in tempScenes {
            i.scaleMode = .aspectFill
        }
        self.scenes = tempScenes
        
        let tempScenesCloseUps:  [SKScene] = [WindowCloseup(), EntranceCloseup(), KitchenCloseup(), ShelfCloseup()]
        for i in tempScenesCloseUps {
            i.scaleMode = .aspectFill
        }
        self.scenesCloseUp = tempScenesCloseUps
    }
    
    var body: some View {
        switch currentScene {
        case .WINDOW:
            ScenePositions(currentScene: $currentScene, destinationRight: .KITCHEN, destinationLeft: .ENTRANCE, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 0)
            
        case .ENTRANCE:
            ScenePositions(currentScene: $currentScene, destinationRight: .WINDOW, destinationLeft: .SHELF, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 1)
            
        case .KITCHEN:
            ScenePositions(currentScene: $currentScene, destinationRight: .SHELF, destinationLeft: .WINDOW, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 2)
            
        case .SHELF:
            ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .KITCHEN, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 3)
            
        case .NONE:
            ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .KITCHEN, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 3)
        }
        Text("")
            .onAppear() {
                // Activating the WCSession
                iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
            }
    }
}

#Preview {
    GameView()
}
