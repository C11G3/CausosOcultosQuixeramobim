//
//  KitchenWindow.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import Foundation
import SpriteKit

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
class KitchenCloseup: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "zoomedWindowRoom")
    var wasEnemyHere = false

    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        
        if GameController.sheerd.kitchenWindow.parent == nil {
            GameController.sheerd.kitchenWindow.position.y = frame.midY
            GameController.sheerd.kitchenWindow.position.x = frame.midX * 1.1
            GameController.sheerd.kitchenWindow.size = CGSize(width: 0.8, height: 1)
            GameController.sheerd.kitchenWindow.alpha = 1.0
            GameController.sheerd.kitchenWindow.zPosition = 100
            addChild(GameController.sheerd.kitchenWindow)
            wasEnemyHere = true
        }
        
        if backGround.parent == nil {
            addChild(backGround)
        }
    }
    
    // Check if the object is being touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if GameController.sheerd.enemy.canAppear(position: .KITCHEN) {
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.kitchenWindow)

    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        if GameController.sheerd.enemy.getPosition() != GameController.sheerd.kitchenWindow.getPosition() && wasEnemyHere == true{
            GameController.sheerd.enemy.removeFromParent()
        }
    }
}
