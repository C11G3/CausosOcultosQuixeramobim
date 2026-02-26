//
//  SceneManager.swift
//  CausosOcultos
//
//  Created by Dayô Araújo on 25/02/26.
//

import Foundation
import SwiftUI

@Observable
class SceneManager {
    public var isZoomed: Bool = false
    
    static var shared : SceneManager = {
        let instance = SceneManager()
        return instance
    }()
}
