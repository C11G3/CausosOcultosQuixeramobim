//
//  TesteConnect.swift
//  CausosOcultos
//
//  Created by Francisco Losada on 24/02/26.
//

import SwiftUI
import WatchConnectivity

struct TesteConnect: View {
    @State var currentMonsterPosition : [String:String]? = ["": "NONE"]
    var position: Positions = .ENTRANCE
    var body: some View {
        Button {
            // Sending the message to watch
            iOSConnectivity.shared.sendToWatch(passData: ["" : position.rawValue])
        } label: {
            Circle()
                .frame(width: 200)
        }
        Text("Recieved message: \(currentMonsterPosition ?? [ "" : "NONE"])")

        
        .onAppear() {
            // Activating the WCSession
            iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
        }
        .onReceive(iOSConnectivity.shared.$receivedData) { data in
            currentMonsterPosition = data as? [String : String]
        }
        
    }

}

#Preview {
    TesteConnect()
}
