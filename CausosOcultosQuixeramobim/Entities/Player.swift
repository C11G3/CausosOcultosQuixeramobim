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
    var damage : Double = 1
    
    var barricadeTimer: Date = Date.now
    var reloadBarricadeTimer: Date = Date.now

    var actualBarricades: Int = 3
    var maxBarricades : Double = 3
    
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
        let now = Date.now
        if now.timeIntervalSince(barricadeTimer) >= 2 && actualBarricades > 0{
            SoundManager.instance.playSound(sound: .madeiraJanela)
            let barricade = Barricade()
            breach.addBarricades(barricade: barricade)
            barricadeTimer = Date.now
            actualBarricades -= 1
        }
    }
    
    private func reciveBarricada(){
        let now = Date.now
        if now.timeIntervalSince(reloadBarricadeTimer) >= 3 && actualBarricades < 3{
            actualBarricades += 1
            print("BARRICADAAAAA")
        }
    }
    
    /// Function responsible to set the knowledge of the enemy's weakness
    func setKnowledge(){
        knowledge = true
    }
    
    func reset(){
        actualPosition = .WINDOW
        isAlive = true
        knowledge = false
        barricadeTimer = Date.now
        damage = 1
        maxBarricades = 3
        actualBarricades = 3
    }
    
    func update(){
        reciveBarricada()
    }
}
