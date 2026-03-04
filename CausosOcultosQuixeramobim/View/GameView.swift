//
//  ContentView.swift
//  CausosOcultos
//
//  Created by Isabela Hissa Pinto on 23/02/26.
//

import SwiftUI
import SpriteKit
import WatchConnectivity

/// Display the main view
/// `init:`  Scene initialization out of its array
struct GameView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    @State var currentScene: Positions = .WINDOW
    @State var monsterPosition: Positions?
    @State var baitMonsterPosition : [String:String]? = ["": "NONE"]
    @State var currentHour: Int = 4
    var scenes: [SKScene]
    
    init() {
        let tempScenes:  [SKScene] = [Window(), Entrance(), Kitchen(), Shelf()]
        for i in tempScenes {
            i.scaleMode = .fill
        }
        self.scenes = tempScenes
    }
    
    var body: some View {
        if SceneManager.shared.isPlayerAlive == true && GameController.sheerd.countdownTimer > 0 {
            ZStack {
                switch currentScene {
                case .WINDOW:
                    ScenePositions(currentScene: $currentScene, destinationRight: .SHELF, destinationLeft: .KITCHEN, scenes: scenes, index: 0)
                    
                case .ENTRANCE:
                    ScenePositions(currentScene: $currentScene, destinationRight: .KITCHEN, destinationLeft: .SHELF, scenes: scenes, index: 1)
                    
                case .KITCHEN:
                    ScenePositions(currentScene: $currentScene, destinationRight: .WINDOW, destinationLeft: .ENTRANCE, scenes: scenes, index: 2)
                    
                case .SHELF:
                    ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .WINDOW, scenes: scenes, index: 3)
                    
                case .NONE:
                    ScenePositions(currentScene: $currentScene, destinationRight: .ENTRANCE, destinationLeft: .KITCHEN, scenes: scenes, index: 3)
                }
                if !SceneManager.shared.isZoomed {
                    VStack (alignment: .trailing) {
                        HourIndicator(currentTime: $currentHour)
                            .padding(.top, UIScreen.main.bounds.height * 0.1)
                            .padding(.leading, UIScreen.main.bounds.width * 0.7)
                        Spacer()
                    }
                }
            }
        } else if SceneManager.shared.isPlayerAlive == true && GameController.sheerd.countdownTimer <= 0 {
            VictoryView(navigator: _navigator)
                .onAppear{
                    SoundManager.instance.deleteAllSounds()
                    SoundManager.instance.playSound(sound: .opening)
                }
        } else {
            GameOverView(navigator: _navigator)
                .onAppear{
                    SoundManager.instance.deleteAllSounds()
                    SoundManager.instance.playSound(sound: .capeloboOrigin, volume: 0.3)
                    SoundManager.instance.playSound(sound: .opening)

                }
        }
        Text("")
            .onAppear() {
                SoundManager.instance.deleteAllSounds()
                SoundManager.instance.playSound(sound: .vento, volume: 0.3)
                SoundManager.instance.playSound(sound: .grilosAmbiente, volume: 0.005)
                GameController.sheerd.startTimer()
            }
            .onChange(of: GameController.sheerd.enemy.actualPosition) {
                monsterPosition = GameController.sheerd.enemy.getPosition()
                iOSConnectivity.shared.sendToWatch(passData: ["" : monsterPosition!.rawValue])
                print(monsterPosition!)
            }
            .onChange(of: GameController.sheerd.currentHour) {
                self.currentHour = GameController.sheerd.currentHour
            }
            .onChange(of: currentScene) {
                SoundManager.instance.playSound(sound: .passos, volume: 0.5)
            }
            .onChange(of: SceneManager.shared.isZoomed) {
                SoundManager.instance.playSound(sound: .passos, volume: 0.5)
            }
            .onChange(of: SceneManager.shared.isPlayerAlive){
                if SceneManager.shared.isPlayerAlive {
                    SoundManager.instance.playSound(sound: .vento, volume: 0.3)
                    SoundManager.instance.playSound(sound: .grilosAmbiente, volume: 0.005)
                }
            }
            .onReceive(iOSConnectivity.shared.$receivedData) { data in
                baitMonsterPosition = data as? [String : String]
                GameController.sheerd.enemy.baitPosition(baitPosition: baitMonsterPosition!)
                print("Recieved message: \(baitMonsterPosition ?? [ "" : "NONE"])")
            }
            .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    GameView()
}
