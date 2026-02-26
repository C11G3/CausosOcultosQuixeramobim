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
    
    private init(){
        window.actualPosition = .WINDOW
        kitchenWindow.actualPosition = .KITCHEN
        door.actualPosition = .ENTRANCE
    }
    
    var enemy = Enemy()
    var player = Player()
    
    var window = Breach()
    var kitchenWindow = Breach()
    var door = Breach()
    
    func update(){
        enemy.update()
        window.update()
        kitchenWindow.update()
        door.update()
    }
    
}
