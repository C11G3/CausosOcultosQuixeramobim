//
//  CausosOcultosQuixeramobimApp.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import SwiftUI

@main
struct CausosOcultosQuixeramobimApp: App {
    init(){
        MyFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TesteConnect()
        }
    }
}
