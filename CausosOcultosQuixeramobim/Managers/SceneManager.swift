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
    
    static var shared : SceneManager = {
        let instance = SceneManager()
        return instance
    }()
}
