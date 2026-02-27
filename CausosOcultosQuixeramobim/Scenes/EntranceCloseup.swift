//
//  EntranceDoor.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import Foundation
import SpriteKit

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
class EntranceCloseup: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "zoomedWindowRoom")
    var wasEnemyHere = false
    
    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        
        if backGround.parent == nil {
            addChild(backGround)
        }
        
        if GameController.sheerd.enemy.canAppear(position: .ENTRANCE) {
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
        
        if GameController.sheerd.door.parent == nil{
            GameController.sheerd.door.position.y = frame.midY
            GameController.sheerd.door.position.x = frame.midX
            GameController.sheerd.door.size = CGSize(width: 0.8, height: 0.8)
            
            addChild(GameController.sheerd.door)
        }
    }
    
    // Check if the object is being touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.door)
    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        
        if GameController.sheerd.enemy.getPosition() != GameController.sheerd.door.getPosition() && wasEnemyHere == true{
            GameController.sheerd.enemy.removeFromParent()
        }
    }
}
