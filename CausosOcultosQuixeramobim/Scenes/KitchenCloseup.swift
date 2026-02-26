//
//  KitchenWindow.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 23/02/26.
//

import Foundation
import SpriteKit

class KitchenCloseup: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "zoomLeft")
    
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        
        if backGround.parent == nil {
            addChild(backGround)
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
    
    }
}
