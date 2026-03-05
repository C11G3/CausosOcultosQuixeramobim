//
//  CameraView.swift
//  CausosOcultosWatch Watch App
//
//  Created by Francisco Losada on 24/02/26.
//

import SwiftUI
/// Camera View is the vision of one of the external cameras
/// - Parameter scene: variable to select the current view
/// - Parameter width: width of the watch screen
/// - Parameter heigth: height of the watch screen
struct CameraView: View {
    var scene: String
    var width = WKInterfaceDevice.current().screenBounds.width
    var height = WKInterfaceDevice.current().screenBounds.height
    var monsterPositoon: String
    
    var body: some View {
        ZStack {
            Image(scene)
                .resizable()
                .aspectRatio(contentMode: .fill )
                .frame(width: width, height: height)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(sceneName(name: scene))
                        .font(.custom("RubikDirt-Regular", size: 14))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Button {
                        print(scene)
                        watchOSConnectivity.shared.sendApplicationContext(data: ["" : monsterPositoon])
                        WKInterfaceDevice.current()
                            .play(.click)
                    } label: {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width:60, height:20)
                            .foregroundStyle(.black)
                            .padding(5)
                            .overlay(
                                Text("Atrair")
                                    .font(.custom("RubikDirt-Regular", size: 14))
                            )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 15)
                
                Spacer()
            }
        }
    }
    
    func sceneName(name: String) -> String {
        switch scene {
        case "KITCHEN":
            return "Cozinha"
        case "ENTRANCE":
            return "Entrada"
        case "WINDOW":
            return "Janela"
        case "KITCHENMONSTER":
            return "Cozinha"
        case "ENTRANCEMONSTER":
            return "Entrada"
        case "WINDOWMONSTER":
            return "Janela"
        default:
            return "Entrada"
        }
    }
}

#Preview {
    CameraView(scene: "ENTRANCE", monsterPositoon: "ENTRANCE")
}
