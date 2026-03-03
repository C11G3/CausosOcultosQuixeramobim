//
//  ViewNavigator.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 03/03/26.
//

import Foundation
import SwiftUI

@Observable
class ViewNavigator {
    var navigationPath: [Routes] = []
    var startingPath: Routes = .menu

    func navigateTo(_ route: Routes) {
        navigationPath.append(route)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func setRoute(_ route: Routes) {
        startingPath = route
    }
    
    func clear() {
        navigationPath.removeAll()
    }
}

enum Routes {
    case menu
    case victory
    case game
    case defeat
    case intro
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .menu:
            MenuView()
        case .victory:
            VictoryView()
        case .game:
            GameView()
        case .defeat:
            GameOverView()
        case .intro:
            TesteConnect()
        }
    }
}
