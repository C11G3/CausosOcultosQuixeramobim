//
//  WatchView.swift
//  CausosOcultosWatch Watch App
//
//  Created by Carolina Sun on 23/02/26.
//

import SwiftUI

/// WatchView is used to see all the external cameras on the watch
/// - Parameter scrollAmount: Var to select the current Tab with the Watch Crown
/// - Parameter currentMonsterPosition: Var to receive the position of the monster from the iOS
struct WatchView: View {
    @State var scrollAmount = 0.0
    @State var currentMonsterPosition: [String : String]? = ["": "NONE"]
    
    var body: some View {
        TabView(selection: $scrollAmount) {
            CameraView(scene: currentMonsterPosition == ["" : "ENTRANCE"] ? "ENTRANCEMONSTER" : "ENTRANCE")
                .tag(0)
            CameraView(scene: currentMonsterPosition == ["" : "WINDOW"] ? "WINDOWMONSTER" : "WINDOW")
                .tag(1)
            CameraView(scene: currentMonsterPosition == ["" : "SHELF"] ? "SHELFMONSTER" : "SHELF")
                .tag(2)
            CameraView(scene: currentMonsterPosition == ["" : "KITCHEN"] ? "KITCHENMONSTER" : "KITCHEN")
                .tag(3)
        }
        .tabViewStyle(.carousel)
        .focusable(true)
        .digitalCrownRotation($scrollAmount, from: 0, through: 3, by: 1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
        ._statusBarHidden()
        .onReceive(watchOSConnectivity.shared.$receivedData) { data in
            currentMonsterPosition = data as? [String : String]

        }
    }
}

#Preview {
    WatchView()
}
