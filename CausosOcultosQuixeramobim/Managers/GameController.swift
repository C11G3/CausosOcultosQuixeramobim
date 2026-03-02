//
//  dummie.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import Foundation
import SpriteKit

@Observable
class GameController {
    public static var sheerd = GameController.init()
    
    var enemy = Enemy()
    var player = Player()
    
    var window = Breach(texture: SKTexture(imageNamed: "window"), actualPosition: .WINDOW)
    var kitchenWindow = Breach(texture: SKTexture(imageNamed: "window"), actualPosition: .KITCHEN)
    var door = Breach(texture: SKTexture(imageNamed: "window"), actualPosition: .ENTRANCE)
    
    var countdownTimer = 30
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.countdownTimer > 0 {
                self.countdownTimer -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    func canAppear(position: Positions) -> Bool {
        if enemy.getPosition() == position && enemy.getState() == .ATTACKING && enemy.parent == nil {
            return true
        }
        return false
    }
    
    func update(){
        enemy.update()
        window.update()
        kitchenWindow.update()
        door.update()
    }
    
    func reset(){
        enemy.reset()
        player.reset()
        window.reset()
        kitchenWindow.reset()
        door.reset()
        countdownTimer = 30
    }
}
