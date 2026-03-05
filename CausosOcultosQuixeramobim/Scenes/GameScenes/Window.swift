//
//  Scene1.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit
import SwiftUI

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
/// - Parameter window: SKSpriteNode of window image
class Window: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "windowRoom")
    var barricades: [Barricade] = []
    var wasEnemyHere = false
    
    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
                
        if backGround.parent == nil {
            addChild(backGround)
        }
        
        if GameController.sheerd.window.parent == nil {
            GameController.sheerd.window.position.y = frame.midY
            GameController.sheerd.window.position.x = frame.midX
            GameController.sheerd.window.size.width = frame.size.width
            GameController.sheerd.window.size.height = frame.size.height
            GameController.sheerd.window.alpha = 1.0
            GameController.sheerd.window.zPosition = 5
            
            addChild(GameController.sheerd.window)
        }
        
        if GameController.sheerd.enemy.parent == nil && GameController.sheerd.enemy.getPosition() == .NONE && GameController.sheerd.enemy.getState() == .ATTACKING && wasEnemyHere == false{
            GameController.sheerd.enemy.position.y = 0
            GameController.sheerd.enemy.position.x = 0
            GameController.sheerd.enemy.zPosition = 99
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // Check if the object is being touched
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        if SceneManager.shared.isZoomed == true {
            GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.window)
        }else {
            SceneManager.shared.isZoomed = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        
        if SceneManager.shared.isZoomed == true {
            backGround.size.width = frame.width * 1.4
            backGround.size.height = frame.height * 1.4
            GameController.sheerd.window.size.width = frame.size.width * 1.4
            GameController.sheerd.window.size.height = frame.size.height * 1.4
            GameController.sheerd.window.scaleBarricades(scale: 1.0)
        } else {
            backGround.size.width = frame.width
            backGround.size.height = frame.height
            GameController.sheerd.window.size.width = frame.size.width
            GameController.sheerd.window.size.height = frame.size.height
            GameController.sheerd.window.scaleBarricades(scale: 0.7)
        }
        
        if GameController.sheerd.enemy.actualPosition != .ENTRANCE && wasEnemyHere == true {
            GameController.sheerd.enemy.removeFromParent()
        }
    }
}

#Preview {
    GameView()
}
