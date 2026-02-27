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
    @State var monsterPosition: Positions?
    @State var baitMonsterPosition : [String:String]? = ["": "NONE"]
    var scenes: [SKScene]
    var scenesCloseUp: [SKScene]
    
    init() {
        let tempScenes:  [SKScene] = [Window(), Entrance(), Kitchen(), Shelf()]
        for i in tempScenes {
            i.scaleMode = .fill
        }
        self.scenes = tempScenes
        
        let tempScenesCloseUps:  [SKScene] = [WindowCloseup(), EntranceCloseup(), KitchenCloseup(), ShelfCloseup()]
        for i in tempScenesCloseUps {
            i.scaleMode = .fill
        }
        self.scenesCloseUp = tempScenesCloseUps
    }
    
    var body: some View {
        if SceneManager.shared.isPlayerAlive == true && GameController.sheerd.countdownTimer > 0 {
            switch currentScene {
            case .WINDOW:
                ScenePositions(currentScene: $currentScene, destinationRight: .SHELF, destinationLeft: .KITCHEN, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 0)
                
            case .ENTRANCE:
                ScenePositions(currentScene: $currentScene, destinationRight: .KITCHEN, destinationLeft: .SHELF, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 1)
                
            case .KITCHEN:
                ScenePositions(currentScene: $currentScene, destinationRight: .WINDOW, destinationLeft: .ENTRANCE, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 2)
                
            case .SHELF:
                ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .WINDOW, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 3)
                
            case .NONE:
                ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .KITCHEN, scenes: scenes, scenesCloseUp: scenesCloseUp, index: 3)
            }
        } else if SceneManager.shared.isPlayerAlive == true && GameController.sheerd.countdownTimer <= 0 {
            TesteConnect()
            
        } else {
            GameOverView()
        }
        Text("")
            .onAppear() {
                // Activating the WCSession
                iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
                GameController.sheerd.startTimer()
            }
            .onChange(of: GameController.sheerd.enemy.actualPosition) {
                monsterPosition = GameController.sheerd.enemy.getPosition()
                iOSConnectivity.shared.sendToWatch(passData: ["" : monsterPosition!.rawValue])
                print(monsterPosition!)
            }
            .onReceive(iOSConnectivity.shared.$receivedData) { data in
                baitMonsterPosition = data as? [String : String]
                GameController.sheerd.enemy.baitPosition(baitPosition: baitMonsterPosition!)
                print("Recieved message: \(baitMonsterPosition ?? [ "" : "NONE"])")
            }
    }
}

#Preview {
    GameView()
}
