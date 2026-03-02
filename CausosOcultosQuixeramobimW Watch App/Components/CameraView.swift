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
                Spacer()
                Button {
                    print(scene)
                    watchOSConnectivity.shared.sendApplicationContext(data: ["" : monsterPositoon])
                    
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width:60, height:20)
                        .foregroundStyle(.black)
                    
                }
                .buttonStyle(.plain)
                .padding(5)
                .overlay(
                    Text("Atrair")
                        .font(.RubikDirt(fontStyle: .caption))
                )
                .padding(15)
            }
        }
    }
}

#Preview {
    CameraView(scene: "ENTRANCE", monsterPositoon: "ENTRANCE")
}
