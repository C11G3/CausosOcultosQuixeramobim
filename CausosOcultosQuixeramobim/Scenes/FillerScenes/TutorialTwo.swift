//
//  TutorialTwo.swift
//  CausosOcultosQuixeramobim
//
//  Created by Enzo Ferroni on 05/03/26.
//

import SpriteKit

class TutorialTwo: SKScene {
    var backGround: SKSpriteNode = SKSpriteNode(imageNamed: "tutorial2")
    
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
        SceneManager.shared.currentScene = .eleven
    }

    override func update(_ currentTime: TimeInterval) {
    }
}
