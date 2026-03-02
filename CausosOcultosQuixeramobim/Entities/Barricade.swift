//
//  Barricade.swift
//  CausosOcultos
//
//  Created by Tamires Mendes da Silva on 23/02/26.
//
import SwiftUI
import Foundation
import SpriteKit
/**
 Code Documentation
 
 ## Variables
 - var timer: this variable gets the date/time using a date formatter
 - var deltaTimer: this variable its used to create the time interval for the barricade degradation
 - var autoDamage: this variable its used create the received damage for the barricade
 - var health: this var gets the total of the barricade health

 */
class Barricade: SKSpriteNode {
    private var health: Double = 20
    private var timer = Date.now
    private var deltaTimer: Double = 5
    private var autoDamage: Double = 5
    
//    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
//        super.init(texture: texture, color: color, size: size)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    /// Function that reduces the barricade health as time passes.
    ///
    /// - Parameters:
    ///     - damage: Damage to be inserted into the bellies
    ///
    func decayHealth() {
        let now = Date.now
        if now.timeIntervalSince(timer) >= deltaTimer {
            timer = Date.now
            applyDamage(autoDamage)
            if health <= 0 {
                self.removeFromParent()
            }
        }
    }
    
    /// Function that assigns damage to the Barricade
    ///
    /// - Parameters:
    ///     - damage: Damage to be inserted into the bellies
    ///
    func applyDamage(_ damage: Double) {
        health -= damage
    }
    
    /// Function that get the actual health
    func getHealth() -> Double {
        return health
    }
    
    func reset(){
        health = 20
        timer = Date.now
        deltaTimer = 3
        autoDamage = 5
    }
}
