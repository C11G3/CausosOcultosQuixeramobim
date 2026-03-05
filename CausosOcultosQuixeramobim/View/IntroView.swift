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
    @State var currentScene: Intro = .one
    var scenes: [SKScene]
    
    init() {
        let tempScenes:  [SKScene] = [IntroOne(), IntroTwo(), IntroThree(), IntroFour(), IntroFive(), IntroSix(), IntroSeven(), TutorialOne(), TutorialTwo(), TutorialThree(), TutorialFour()]
        for i in tempScenes {
            i.scaleMode = .fill
        }
        self.scenes = tempScenes
    }
    
    var body: some View {
        switch currentScene {
        case .one:
            ZStack{
                SpriteView(scene: scenes[0])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack {
                        ArrowButtonIntro(sceneState: $currentScene, destination: .two)
                    }
                }
            }
        case .two:
            ZStack {
                SpriteView(scene: scenes[1])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .three)
                    }
                }
            }
        case .three:
            ZStack {
                SpriteView(scene: scenes[2])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .four)
                    }
                }
            }
        case .four:
            ZStack {
                SpriteView(scene: scenes[3])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .five)
                    }
                }
            }
        case .five:
            ZStack {
                SpriteView(scene: scenes[4])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .six)
                    }
                }
            }
        case .six:
            ZStack {
                SpriteView(scene: scenes[5])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .seven)
                    }
                }
            }
            
        case .seven:
            ZStack {
                SpriteView(scene: scenes[6])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .eight)
                    }
                }
            }
        case .eight:
            ZStack {
                SpriteView(scene: scenes[7])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .nine)
                    }
                }
            }
        case .nine:
            ZStack {
                SpriteView(scene: scenes[8])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .ten)
                    }
                }
            }
        case .ten:
            ZStack {
                SpriteView(scene: scenes[9])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        ArrowButtonIntro(sceneState: $currentScene, destination: .eleven)
                    }
                }
            }
        case .eleven:
            ZStack {
                SpriteView(scene: scenes[10])
                    .position(CGPoint(x: Double(UIScreen.main.bounds.midX), y: Double(UIScreen.main.bounds.midY * 1.1)))
                    .frame(height: UIScreen.main.bounds.height * 1.1)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    VStack{
                        Button {
                            navigator.clear()
                            navigator.navigateTo(.game)
                            SceneManager.shared.isPlayerAlive = true
                            GameController.sheerd.reset()
                        } label: {
                            Image("chevronRight")
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    }
                }
            }
        }
    }
}
