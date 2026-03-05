//
//  BarricadeIndicator.swift
//  CausosOcultosQuixeramobim
//
//  Created by Francisco Losada on 04/03/26.
//

import SwiftUI

struct BarricadeIndicator: View {
    var body: some View {
        HStack {
            Image("barricadeSymbol")
                .resizable()
                .frame(width: 40, height: 43)
            Text("\(GameController.sheerd.currentBarricade)/\(Int(GameController.sheerd.player.maxBarricades))")
                .font(.custom("RubikDirt-Regular", size: 30))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    BarricadeIndicator()
}
