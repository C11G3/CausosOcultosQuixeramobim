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
        
        if backGround.parent == nil {
            addChild(backGround)
            addChild(GameController.sheerd.window)

        }
        
        if GameController.sheerd.enemy.canAppear(position: .WINDOW) {
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
        if GameController.sheerd.window.parent == nil{
            GameController.sheerd.window.position.y = frame.midY
            GameController.sheerd.window.position.x = frame.midX
            GameController.sheerd.window.size = CGSize(width: 0.8, height: 0.8)
            
            addChild(GameController.sheerd.window)
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
