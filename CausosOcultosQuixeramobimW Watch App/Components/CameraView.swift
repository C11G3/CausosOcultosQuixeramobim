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
                    watchOSConnectivity.shared.sendApplicationContext(data: ["" : scene])
                    
                } label: {
                    Text("Attract")
                }
                .buttonStyle(.plain)
                .padding(15)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(15)
            }
        }
    }
}

#Preview {
    CameraView(scene: "scene")
}
