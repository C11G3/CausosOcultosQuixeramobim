//
//  Player.swift
//  CausosOcultos
//
//  Created by Jonas Fernando Nascimento Melo on 24/02/26.
//

import Foundation
import SpriteKit
import SwiftUI

/**
 Code Documentation
 
 ## Variables
 
 - private var actualPosition : Keep the enemy's current position.
 - var isAlive : Verification is the player stills alive
 - var knowledge : Verification is the player can hit the enemy
 - var barricadeCooldown : time to build a barricade
 - var damage : Set the damage of the Player can deal to the enemy
 */
class Player: SKSpriteNode {
    
    @State var actualPosition : Positions = .WINDOW
    var isAlive : Bool = true
    var knowledge : Bool = false
    var barricadeCooldown : Double = 2
    var damage : Double = 1
    
    /// Function responsible for defining the player's position between scenes.
    func walk(position: Positions) {
        actualPosition = position
    }
    
    /// Function responsible for attacking the enemy checks if the player has the necessary knowledge and if they are in the same position as the enemy.
    func attackEnemy(enemy: Enemy) {
        if knowledge == true && actualPosition == enemy.getPosition() && enemy.getState() == .ATTACKING{
            enemy.applyDamage(damage: damage)
            return
        }
        enemy.difficulty += 2
    }
    
    /// Function responsible for adding a barricade to the breach.
    func buildBarricade(breach: Breach){
//        SKAction.animate(with: <#T##[SKTexture]#>, timePerFrame: <#T##TimeInterval#>)
            let barricade = Barricade(color: UIColor.blue, size: CGSize(width: 0.001, height: 0.001))
            breach.addBarricades(barricade: barricade)
            print(breach.getNumOfBarricade())
    }
    
    /// Function responsible to set the knowledge of the enemy's weakness
    func setKnowledge(){
        knowledge = true
    }
}
