//
//  SoundManager.swift
//  CausosOcultosQuixeramobim
//
//  Created by Tamires Mendes da Silva on 02/03/26.
//

import SwiftUI
import AVFoundation

@Observable class SoundManager {
    var playingSound: AVAudioPlayer?
    
    init(playingSound: AVAudioPlayer? = nil) {
        self.playingSound = playingSound
    }
    
    //singleton para nao precisar inicializar em cada view
    static let instance = SoundManager()
    
    // colocar nomes audios aqui, no enum.
    enum soundTypes: String {
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
    }
    
    func playSound(sound: soundTypes) {
        
        guard let path = Bundle.main.path(forResource: sound.rawValue, ofType: "mp3") else {
            print("The sound path was not created")
            return
        }
        
        let url = URL(filePath: path)
        
        do {
            playingSound = try AVAudioPlayer(contentsOf: url)
            playingSound?.volume = 0.1
            playingSound?.play()
        }
        catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
    }
}

