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
    var kitchenWindow = Breach(texture: SKTexture(imageNamed: "kitchenWindow"), actualPosition: .KITCHEN)
    var door = Breach(texture: SKTexture(imageNamed: "door"), actualPosition: .ENTRANCE)
    
    var countdownTimer = 300
    var currentHour = 0
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.countdownTimer > 0 {
                self.countdownTimer -= 1
                switch self.countdownTimer {
                case 225:
                    self.currentHour = 3
                case 150:
                    self.currentHour = 4
                case 75:
                    self.currentHour = 5
                case 1:
                    self.currentHour = 6
                default:
                    return
                }
                
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
        player.update()
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
        currentHour = 0
    }
}
