//
//  Enemy.swift
//  CausosOcultos
//
//  Created by Enzo Ferroni on 23/02/26.
//

import Foundation
import SpriteKit

/**
 Code Documentation
 
 ## Variables
 - private var actualState: Keep the enemy's current state.
 - private var actualPosition: Keep the enemy's current position.
 
 - private var health: Keep the enemy's current health.
 - private var barricadeDamage: Keep the enemy's damage
 - var difficulty: probability of apply an effect in the enemy.
 
 - private var attackTimer: timer for the attack
 - private var attackDeltaTime: interval for an attack to occur
 */
class Enemy: SKSpriteNode {
    
    private var actualState: EnemyStates = .IDLE
    public var actualPosition: Positions = .NONE
    
    private var health: Double = 3
    private var barricadeDamage: Double = 20
    var difficulty: Double = 5
    
    private var walkTimer: Date = Date.now
    private var attackTimer: Date = Date.now
    private var attackDeltaTime: Double = 10

    init() {
        super.init(texture: SKTexture(imageNamed: "capelobo"), color: UIColor.blue, size: CGSize(width: 1, height: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// Function responsible for guiding the enemy's movement through the scenes, if the enemy is not in the attack state.
    private func walk() {
        if actualState != .ATTACKING {
            
            switch actualPosition {
            case .WINDOW:
                decideAction(position1: .KITCHEN, position2: .SHELF)
            case .SHELF:
                decideAction(position1: .WINDOW, position2: .ENTRANCE)
            case .KITCHEN:
                decideAction(position1: .WINDOW, position2: .ENTRANCE)
            case .ENTRANCE:
                decideAction(position1: .KITCHEN, position2: .SHELF)
            case .NONE:
                let rand = Int.random(in: 0...3)
                switch rand {
                case 0:
                    actualPosition = .KITCHEN
                case 1:
                    actualPosition = .ENTRANCE
                case 2:
                    actualPosition = .SHELF
                case 3:
                    actualPosition = .WINDOW
                default: break
                }
            }
            print(actualPosition)
        }
    }
    
    /// Auxiliary Function that randomly determines the enemy's future position, with the highest probability of causing the enemy to attack.
    ///
    /// - Parameters:
    ///     - position1: Likely future position of the enemy
    ///     - position2: Other likely future position of the enemy
    private func decideAction(position1: Positions, position2: Positions) {
        let rand = Int.random(in: 0...99)
        
        if rand < 25 {
            actualPosition = position1
        } else if rand < 50{
            actualPosition = position2
        } else {
            actualState = .ATTACKING
        }
    }
    
    private func stringToPosition(position: [String: String]) -> Positions {
        switch position {
        case ["": "KITCHEN"]:
            return .KITCHEN
        case ["": "ENTRANCE"]:
            return .ENTRANCE
        case ["": "SHELF"]:
            return .SHELF
        case ["": "WINDOW"]:
            return .WINDOW
        default:
            return .NONE
        }
    }
    
    /// Auxiliary Function that randomly determines the enemy's future position, with the highest probability of causing the enemy to attack.
    ///
    /// - Parameters:
    ///     - position: Likely future position of the enemy
    func baitPosition(baitPosition: [String: String]) {
        let rand = Int.random(in: 0...99)
        let currentPosition: Positions = stringToPosition(position: baitPosition)
        if rand < 80 {
            self.actualPosition = currentPosition
        }
    }
    
    /// Function that receives the breach to be attacked and performs an attack at regular intervals.
    ///
    /// - Parameters:
    ///     - breach: Breach is going to be attacked.
    ///
    func attack(breach: Breach) {
        let now = Date.now
        
        if actualState == .ATTACKING && now.timeIntervalSince(attackTimer) >= attackDeltaTime {
            attackTimer = Date.now
            breach.applyDamage(damage: barricadeDamage)
            print("ATAkOU")
        }
        if breach.getNumOfBarricade() == 0 {
            SceneManager.shared.isPlayerAlive = false

        }
       
    }
    
    /// Function that applies effects to the enemy.
    ///
    /// - Parameters:
    ///     - effect: Effect that will be applicated in the enemy
    func applyEffect(effect:EnemyStates){
        if difficulty / 20 <= Double.random(in: 0...1) {
            actualState = effect
        }
    }
    
    /// Function that applies damage to the enemy.
    ///
    /// - Parameters:
    ///     - damege: Damage that will be applicated in the enemy
    func applyDamage(damage: Double){
        health -= damage
    }
    
    func getPosition() -> Positions{
        return actualPosition
    }
    
    func getState() -> EnemyStates{
        return actualState
    }
    
    func canAppear(position: Positions) -> Bool {
        if actualPosition == position && actualState == .ATTACKING && self.parent == nil {
            return true
        }
        return false
    }    
    
    func update(){
        let now = Date.now
        
        if now.timeIntervalSince(walkTimer) > 3{
            walk()
            walkTimer = Date.now
        }
        if actualState == .ATTACKING {
            switch actualPosition {
            case .WINDOW:
                attack(breach: GameController.sheerd.window)
            case .SHELF:
                actualState = .IDLE
            case .KITCHEN:
                attack(breach: GameController.sheerd.kitchenWindow)
            case .ENTRANCE:
                attack(breach: GameController.sheerd.door)
            case .NONE:
                return
            }
        }
    }
}
