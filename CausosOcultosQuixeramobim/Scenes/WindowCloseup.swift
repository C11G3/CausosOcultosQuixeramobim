//
//  WindowCloseup.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import Foundation
import SpriteKit

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
class WindowCloseup: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "zoomedWindowRoom")
    var wasEnemyHere = false
    
    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        
        if GameController.sheerd.window.parent == nil {
            GameController.sheerd.window.position.y = frame.midY
            GameController.sheerd.window.position.x = frame.midX * 1.1
            GameController.sheerd.window.size = CGSize(width: 0.8, height: 1)
            GameController.sheerd.window.alpha = 1.0
            GameController.sheerd.window.zPosition = 100
            addChild(GameController.sheerd.window)
            wasEnemyHere = true
        }
        
        if backGround.parent == nil {
            addChild(backGround)
        }
    }

    
    // Check if the object is being touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.window)
    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        if GameController.sheerd.enemy.getPosition() != GameController.sheerd.window.getPosition() && wasEnemyHere == true{
            GameController.sheerd.enemy.removeFromParent()
        }
    }
}
