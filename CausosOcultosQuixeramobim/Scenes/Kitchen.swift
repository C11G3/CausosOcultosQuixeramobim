//
//  Scene2.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit

class Kitchen: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "left")
    var window: SKSpriteNode = SKSpriteNode(imageNamed: "window")
    var isZoomed: Bool = false
    
    override func didMove(to view: SKView) {
        backGround.size = frame.size
        backGround.position.x = frame.midX
        backGround.position.y = frame.midY
        backGround.zPosition = -1
        
        window.size = CGSize(width: 0.5, height: 0.5)
        window.position.x = frame.midX
        window.position.y = frame.midY
        window.zPosition = 1
        window.name = "janela"
                
        if backGround.parent == nil {
            addChild(backGround)
            addChild(window)
        }
        
        if GameController.sheerd.kitchenWindow.parent == nil{
            addChild(GameController.sheerd.kitchenWindow)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let locationInScene = touch.location(in: self)
        
        let touchedNodes = nodes(at: locationInScene)
        
        if let firstNode = touchedNodes.first, firstNode.name == "janela" {
            SceneManager.shared.isZoomed = true
        }
    }
    override func update(_ currentTime: TimeInterval) {
        GameController.sheerd.update()
    }
}
