//
//  IntroView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 03/03/26.
//

import SwiftUI
import SpriteKit

struct IntroView: View {
    @Environment(ViewNavigator.self) var navigator: ViewNavigator
    
    var scenes: [SKScene]
    
    init() {
        let tempScenes:  [SKScene] = [IntroOne(), IntroTwo(), IntroThree(), IntroFour(), IntroFive(), IntroSix(), IntroSeven(), IntroEight(), TutorialOne(), TutorialTwo(), TutorialThree(), TutorialFour(), TutorialFive(), TutorialSix()]
        for i in tempScenes {
            i.scaleMode = .fill
        }
        self.scenes = tempScenes
    }
    
    var body: some View {
        switch SceneManager.shared.currentScene {
        case .one:
            ZStack{
                SpriteView(scene: scenes[0])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
            }
        case .two:
            ZStack {
                SpriteView(scene: scenes[1])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
            }
        case .three:
            ZStack {
                SpriteView(scene: scenes[2])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .four:
            ZStack {
                SpriteView(scene: scenes[3])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                
            }
        case .five:
            ZStack {
                SpriteView(scene: scenes[4])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .six:
            ZStack {
                SpriteView(scene: scenes[5])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                
            }
            
        case .seven:
            ZStack {
                SpriteView(scene: scenes[6])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .eight:
            ZStack {
                SpriteView(scene: scenes[7])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                
            }
        case .nine:
            ZStack {
                SpriteView(scene: scenes[8])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                
            }
        case .ten:
            ZStack {
                SpriteView(scene: scenes[9])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .eleven:
            ZStack {
                SpriteView(scene: scenes[10])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .twelve:
            ZStack {
                SpriteView(scene: scenes[11])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .thirteen:
            ZStack {
                SpriteView(scene: scenes[12])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
            }
        case .fourteen:
            ZStack {
                
                SpriteView(scene: scenes[13])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    VStack{
                        Button {
                            navigator.clear()
                            navigator.navigateTo(.game)
                            SceneManager.shared.isPlayerAlive = true
                            GameController.sheerd.reset()
                        } label: {
                            Image("")
                                .resizable()
                                .frame(width: 800, height: 800)
//                                .border(Color.red, width: 5)
                        }
                    }
                }
                
            }
        }
    }
}
