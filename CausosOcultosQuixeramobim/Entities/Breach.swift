//
//  Breach.swift
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
 - var actualPosition: variable responsible for storing the breach's position
 - var barricades:  array that has the barricades of the branch
 - var barricadeMax: maximum number of barricades that can be added
 */
class Breach: SKSpriteNode {
    private var actualPosition: Positions = .NONE
    private var barricades: [Barricade] = []
    private var barricadeMax: Int = 4
    
    init(texture: SKTexture?, actualPosition: Positions, size: CGSize = CGSize(width: 100, height: 65)) {
        super.init(texture: texture, color: UIColor.black, size: size)
        self.actualPosition = actualPosition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// Function that assigns damage to the newest Barricade
    ///
    /// - Parameters:
    ///     - damage: Damage to be inserted into the bellies
    ///
    func applyDamage(damage: Double) {
        barricades.last?.applyDamage(damage)
        if !barricades.isEmpty{
            if barricades.last!.getHealth() <= 0.0{
                barricades.last?.removeFromParent()
                barricades.removeLast()
                return
            }
        }
    }
    
    /// Function that appends a new barricade to the breach while it's not full
    ///
    /// - Parameters:
    ///     - barricade: barricade that will be added
    ///
    func addBarricades(barricade :Barricade){
        if barricades.count < barricadeMax {
            barricades.append(barricade)
            addChildBarricades()
        }
    }
    
    func addChildBarricades() {
        for i in 0..<barricades.count {
            if barricades[i].parent == nil {
                barricades[i].position.x = frame.midX / 2
                barricades[i].position.y = frame.minY + CGFloat(i)
                barricades[i].size = CGSize(width: 0.1, height: 0.1)
                addChild(barricades[i])
            }
        }
    }
    
    func getNumOfBarricade() -> Int{
        return barricades.count
    }
    
    func getPosition() -> Positions{
        return actualPosition
    }
    func update(){
        for i in 0..<barricades.count {
            barricades[i].decayHealth()
        }
    }
}
