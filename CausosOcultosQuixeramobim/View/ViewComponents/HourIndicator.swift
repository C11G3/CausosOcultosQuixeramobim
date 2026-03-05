//
//  HourIndicator.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 02/03/26.
//

import SwiftUI

/// Component to show the hour in game
/// - Parameter currentTime: Var to get the time in game
struct HourIndicator: View {
    @Binding var currentTime: Int
    
    var body: some View {
        Text(String(currentTime) + " AM")
            .font(.custom("RubikDirt-Regular", size: 37))
            .foregroundStyle(.white)
            .bold()
    }
}
