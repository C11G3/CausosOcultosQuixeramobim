//
//  Scene1.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit
import SwiftUI

class Window: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "windowRoom")
    
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
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let locationInScene = touch.location(in: self)
        
        let touchedNodes = nodes(at: locationInScene)
        
      
        SceneManager.shared.isZoomed = true
        
    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
    }
}

#Preview {
    ContentView()
}
