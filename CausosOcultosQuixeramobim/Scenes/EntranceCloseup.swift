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
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "entrance")
    var wasEnemyHere = false
    
    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size.width = frame.width * 1.4
        backGround.size.height = frame.height * 1.4
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
        
        if backGround.parent == nil {
            addChild(backGround)
        }
        
        if GameController.sheerd.enemy.canAppear(position: .ENTRANCE) {
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
        
        if GameController.sheerd.door.parent == nil {
            GameController.sheerd.door.position.y = frame.midY
            GameController.sheerd.door.position.x = frame.midX
            GameController.sheerd.door.size.width = frame.size.width * 1.4
            GameController.sheerd.door.size.height = frame.size.height * 1.4
            GameController.sheerd.door.alpha = 1.0
            GameController.sheerd.door.zPosition = 100
            backGround.size.width = frame.width * 1.4
            backGround.size.height = frame.height * 1.4
            
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
