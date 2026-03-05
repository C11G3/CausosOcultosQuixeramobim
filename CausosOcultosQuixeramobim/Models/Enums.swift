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

// colocar nomes audios aqui, no enum.
enum SoundTypes: String {
    case ambientacaoNoite
    case ataqueCerto
    case ataqueErrado
    case batimentoCardiaco
    case batimentoLento
    case caminhGrama
    case capeloboOrigin
    case capeloboProximo
    case chamarCapelobo
    case cigarra
    case grilosAmbiente
    case loboUivando
    case madeiraDegradando
    case madeiraJanela
    case mudancaCamera
    case pisoRangendo
    case pagina
    case passos
    case playerMorrendo
    case radio
    case vento
    case opening
}
enum Intro: String {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
}
