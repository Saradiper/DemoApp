//
//  BoxSecondViewBackground.swift
//  A 07 Multiplication table game
//
//  Created by Sara Diaz Perez on 4/4/22.
//

import SwiftUI

struct BoxSecondViewBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 296)
            .padding(.vertical, 16)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 12)
    }
}
