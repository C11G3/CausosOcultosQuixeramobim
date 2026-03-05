//
//  SceneManager.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 25/02/26.
//

import Foundation
import SwiftUI

/// SceneManeger is responsible for managing communication between Spritekit Scenes and SwiftUI Views.
/// - Parameter shared: Singleton
/// - Parameter isZoomed: Indicates if the current view is zoomed or not
@Observable
class SceneManager {
    public var isZoomed: Bool = false
    
    public var isPlayerAlive: Bool = true
    
    private var player: Player = GameController.sheerd.player
    
    public var currentScene: Intro = .one

    
    static var shared : SceneManager = {
        let instance = SceneManager()
        return instance
    }()
    
    func getBarricade() -> Int {
        player.actualBarricades
    }
    
    func putBarricade() -> Bool {
        player.putBarricade
    }
}
