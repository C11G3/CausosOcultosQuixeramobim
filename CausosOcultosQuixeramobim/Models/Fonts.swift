//
//  Fonts.swift
//  CausosOcultosQuixeramobim
//
//  Created by Isabela Hissa Pinto on 26/02/26.
//

import Foundation
import CoreGraphics
import SwiftUI

//Also enable creating custom font
public struct MyFont {
    public static func registerFonts() {
        registerFont(bundle: Bundle.main , fontName: "RubikDirt", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main , fontName: "RubikDoodleShadow", fontExtension: ".ttf")
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

//Function that enable creating custom font
extension Font {
    static func RubikDirt(fontStyle: Font.TextStyle) -> Font {
        return Font.custom("RubikDirt", size: fontStyle.size)
    }
    
    static func RubikDoodleShadow(fontStyle: Font.TextStyle) -> Font {
        return Font.custom("RubikDoodleShadow", size: fontStyle.size)
    }
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 68
        case .title: return 36
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 8
        }
    }
}
