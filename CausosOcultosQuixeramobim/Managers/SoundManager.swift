//
//  SoundManager.swift
//  CausosOcultosQuixeramobim
//
//  Created by Tamires Mendes da Silva on 02/03/26.
//

import SwiftUI
import AVFoundation

@Observable class SoundManager {
    private var playingSounds: [String : AVAudioPlayer] = [:]
    
    //singleton para nao precisar inicializar em cada view
    static let instance = SoundManager()
    
    func playSound(sound: SoundTypes, volume: Float = 0.1) {

        guard let path = Bundle.main.path(forResource: sound.rawValue, ofType: "mp3") else {
            print("The sound path was not created")
            return
        }
        
        let url = URL(filePath: path)
        
        do {
            let playingSound = try AVAudioPlayer(contentsOf: url)
            playingSound.volume = volume
            playingSound.play()
            let audio = [sound.rawValue : playingSound]
            playingSounds.merge(audio){ (current, new) in return new}
        }
        catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func deleteSound(sound: SoundTypes){
        playingSounds.removeValue(forKey: sound.rawValue)
    }
    
    func deleteAllSounds(){
        playingSounds.removeAll()
    }
}
