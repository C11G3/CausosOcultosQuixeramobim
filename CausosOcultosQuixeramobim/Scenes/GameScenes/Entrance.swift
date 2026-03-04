//
//  Right.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit

/// Scene with background and clicable object that allows zooming
/// - Parameter background: SKSpriteNode of background image
/// - Parameter window: SKSpriteNode of window image
class Entrance: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "entrance")
    var door: SKSpriteNode = SKSpriteNode(imageNamed: "door")
    var barricades: [Barricade] = []
    
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
                
        if backGround.parent == nil {
            addChild(backGround)
        }
        
        if GameController.sheerd.door.parent == nil {
            GameController.sheerd.door.position.y = frame.midY
            GameController.sheerd.door.position.x = frame.midX
            GameController.sheerd.door.size.width = frame.size.width
            GameController.sheerd.door.size.height = frame.size.height
            GameController.sheerd.door.alpha = 1.0
            GameController.sheerd.door.zPosition = 100
            
            addChild(GameController.sheerd.door)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    // Check if the object is being touched
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if SceneManager.shared.isZoomed == true {
            GameController.sheerd.player.buildBarricade(breach: GameController.sheerd.door)
        }else {
            SceneManager.shared.isZoomed = true
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        
        if SceneManager.shared.isZoomed == true {
            backGround.size.width = frame.width * 1.4
            backGround.size.height = frame.height * 1.4
            GameController.sheerd.door.size.width = frame.size.width * 1.4
            GameController.sheerd.door.size.height = frame.size.height * 1.4
            GameController.sheerd.door.scaleBarricades(scale: 1.0)
        } else{
            backGround.size.width = frame.width
            backGround.size.height = frame.height
            GameController.sheerd.door.size.width = frame.size.width
            GameController.sheerd.door.size.height = frame.size.height
            GameController.sheerd.door.scaleBarricades(scale: 0.7)

        }
    }
    
    func setSize(width: Int, height: Int){
        self.size = CGSize(width: width, height: height)
    }
}
