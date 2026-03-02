//
//  SoundManager.swift
//  CausosOcultosQuixeramobim
//
//  Created by Tamires Mendes da Silva on 02/03/26.
//

import SwiftUI
import AVFoundation

@Observable class SoundManager {
    @State var playingSound: AVAudioPlayer?
    
    init(playingSound: AVAudioPlayer?) {
        self.playingSound = playingSound
    }
    
    enum soundTypes: String {
        case dummie
    }
    
    func playSound(named: String) {
    
        guard let path = Bundle.main.path(forResource: "", ofType: "mp3") else {
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

