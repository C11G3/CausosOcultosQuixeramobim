//
//  Scene2.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
/// - Parameter window: SKSpriteNode of window image
class Kitchen: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "windowRoom")
    
    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
        
                
        if backGround.parent == nil {
            addChild(backGround)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // Check if the object is being touched
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let locationInScene = touch.location(in: self)
                
        SceneManager.shared.isZoomed = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
    }
}
