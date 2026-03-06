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
    
    var countdownTimer = 120
    var currentHour = 2
    
    var currentBarricade: Int = 3
    var putBarricade: Bool = false
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            print(self.countdownTimer)
            if self.countdownTimer > 0 {
                self.countdownTimer -= 1
                print(self.countdownTimer)
                switch self.countdownTimer {
                case 100:
                    self.currentHour = 3
                case 60:
                    self.currentHour = 4
                case 30:
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
        currentBarricade = SceneManager.shared.getBarricade()
        putBarricade = SceneManager.shared.putBarricade()
    }
    
    func reset(){
        enemy.reset()
        player.reset()
        window.reset()
        kitchenWindow.reset()
        door.reset()
        countdownTimer = 120
        currentHour = 2
        SceneManager.shared.currentScene = .one
    }
}
