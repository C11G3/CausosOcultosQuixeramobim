//
//  TesteConnect.swift
//  CausosOcultos
//
//  Created by Francisco Losada on 24/02/26.
//

import SwiftUI
import WatchConnectivity

struct TesteConnect: View {
    var position: Positions = .ENTRANCE
    var body: some View {
        Button {
            // Sending the message to watch
            iOSConnectivity.shared.sendToWatch(passData: ["" : position.rawValue])
        } label: {
            Circle()
                .frame(width: 200)
        }
        .onAppear() {
            // Activating the WCSession
            iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
        }
    }

}

#Preview {
    TesteConnect()
}
