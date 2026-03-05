//
//  HourIndicator.swift
//  CausosOcultosQuixeramobim
//
//  Created by Dayô Araújo on 02/03/26.
//

import SwiftUI

struct HourIndicator: View {
    @Binding var currentTime: Int
    
    var body: some View {
        Text(String(currentTime) + " AM")
            .font(.custom("RubikDirt-Regular", size: 37))
            .foregroundStyle(.white)
            .bold()
    }
}
