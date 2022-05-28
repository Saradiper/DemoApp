//
//  BoxFirstViewBackground.swift
//  A 07 Multiplication table game
//
//  Created by Sara Diaz Perez on 4/4/22.
//

import SwiftUI

struct BoxFirstViewBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 240)
            .padding(.vertical, 30)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 12)
    }
}
