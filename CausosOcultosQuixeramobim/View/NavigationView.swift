//
//  NavigationView.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 03/03/26.
//

import SwiftUI
import WatchConnectivity

struct NavigationView: View {
    @State var navigation = ViewNavigator()
    
    var body: some View {
        NavigationStack(path: $navigation.navigationPath) {
            navigation.startingPath.view()
                .environment(navigation)
                .navigationBarBackButtonHidden(true)
                .navigationDestination(for: Routes.self) { route in
                    route.view()
                        .environment(navigation)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .onAppear() {
            // Activating the WCSession
            iOSConnectivity.shared.session(iOSConnectivity.shared.session, activationDidCompleteWith: .activated, error: ValidationError.unknown)
        }
    }
}

#Preview {
    NavigationView()
}
