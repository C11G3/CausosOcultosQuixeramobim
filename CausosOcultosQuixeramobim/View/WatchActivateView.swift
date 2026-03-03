//
//  WatchActivateView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Francisco Losada on 03/03/26.
//

import SwiftUI
import WatchConnectivity

struct WatchActivateView: View {
    var body: some View {
        if iOSConnectivity.shared.isConnected {
            Text("foi")
        }
        else {
            Text("nao ofi")
        }
        Text("")
            .onAppear() {
                // Activating the WCSession
                iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
            }
        
    }
}

#Preview {
    WatchActivateView()
}
