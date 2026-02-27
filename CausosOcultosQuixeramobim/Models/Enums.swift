//
//  File.swift
//  CausosOcultos
//
//  Created by Enzo Ferroni on 23/02/26.
//

import Foundation

enum EnemyStates: String {
    case CHASING
    case ATTACKING
    case IDLE
}

enum ValidationError: Error {
    case inactive
    case notActivated
    case unknown
}

/// Player and Enemy enum
enum Positions: String {
    case WINDOW
    case SHELF
    case KITCHEN
    case ENTRANCE
    case NONE
}
