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
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "kitchen")
    var barricades: [Barricade] = []

    // Creates the objects
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
                
        if backGround.parent == nil {
            addChild(backGround)
        }
        
        if GameController.sheerd.kitchenWindow.parent == nil {
            GameController.sheerd.kitchenWindow.position.y = frame.midY
            GameController.sheerd.kitchenWindow.position.x = frame.midX
            GameController.sheerd.kitchenWindow.size.width = frame.size.width
            GameController.sheerd.kitchenWindow.size.height = frame.size.height
            GameController.sheerd.kitchenWindow.alpha = 1.0
            GameController.sheerd.kitchenWindow.zPosition = 100
            
            addChild(GameController.sheerd.kitchenWindow)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // Check if the object is being touched
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        if SceneManager.shared.isZoomed == true {
            GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.kitchenWindow)
        }else {
            SceneManager.shared.isZoomed = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        
        if SceneManager.shared.isZoomed == true {
            backGround.size.width = frame.width * 1.4
            backGround.size.height = frame.height * 1.4
            GameController.sheerd.kitchenWindow.size.width = frame.size.width * 1.4
            GameController.sheerd.kitchenWindow.size.height = frame.size.height * 1.4
            GameController.sheerd.kitchenWindow.scaleBarricades(scale: 1.0)
        } else{
            backGround.size.width = frame.width
            backGround.size.height = frame.height
            GameController.sheerd.kitchenWindow.size.width = frame.size.width
            GameController.sheerd.kitchenWindow.size.height = frame.size.height
            GameController.sheerd.kitchenWindow.scaleBarricades(scale: 0.7)
            
        }
    }
}
