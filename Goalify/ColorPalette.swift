//
//  ColorPalette.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import Foundation
import SwiftUI

struct ColorPalette {
    static let neutralColor = Color(red: 237/255, green: 237/255, blue: 233/255)
    static let primaryColor = Color(red: 255/255, green: 154/255, blue: 169/255)
    static let secondaryColor = Color(red: 245/255, green: 103/255, blue: 126/255)
    static let accentColor = Color(red: 138/255, green: 205/255, blue: 215/255)
    
    
    static let deactivateColor = Color(red: 150/255, green: 150/255, blue: 148/255)
}


struct ColorPalettePreview: PreviewProvider {
    static var previews: some View {
        HStack {
            Rectangle()
                .fill(ColorPalette.neutralColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.0, contentMode: .fit)
            Rectangle()
                .fill(ColorPalette.deactivateColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.0, contentMode: .fit)
            
            
            Rectangle()
                .fill(ColorPalette.primaryColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.0, contentMode: .fit)
            Rectangle()
                .fill(ColorPalette.secondaryColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.0, contentMode: .fit)

            Rectangle()
                .fill(ColorPalette.accentColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.0, contentMode: .fit)
        }
                
    }
}
