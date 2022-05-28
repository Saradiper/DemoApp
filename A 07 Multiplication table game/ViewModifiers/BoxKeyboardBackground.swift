//
//  BoxKeyboardBackground.swift
//  A 07 Multiplication table game
//
//  Created by Sara Diaz Perez on 4/4/22.
//

import SwiftUI

struct BoxKeyboardBackground: ViewModifier {
    @EnvironmentObject var settings: GameSettings
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 56, maxHeight: 56)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 3)
            .foregroundColor(!settings.disallowKeyboard ? .black : .gray)
    }
}
