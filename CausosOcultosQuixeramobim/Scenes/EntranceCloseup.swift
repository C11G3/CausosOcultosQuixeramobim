//
//  EntranceDoor.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import Foundation
import SpriteKit

class EntranceCloseup: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "zoomBack")
    var wasEnemyHere = false
    
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        
        if backGround.parent == nil {
            addChild(backGround)
            addChild(GameController.sheerd.door)

        }
        
        if GameController.sheerd.enemy.canAppear(position: .ENTRANCE) {
            addChild(GameController.sheerd.enemy)
            wasEnemyHere = true
        }
        
        if GameController.sheerd.door.parent == nil{
            addChild(GameController.sheerd.door)
        }
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let locationInScene = touch.location(in: self)
        
        let touchedNodes = nodes(at: locationInScene)
        
        if let firstNode = touchedNodes.first {
            SceneManager.shared.isZoomed = false
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
        
        if GameController.sheerd.enemy.getPosition() != GameController.sheerd.door.getPosition() && wasEnemyHere == true{
            GameController.sheerd.enemy.removeFromParent()
        }
    }
}
