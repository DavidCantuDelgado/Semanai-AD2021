//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 26/10/21.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("RobotoSlab-Bold", size: 32 ))
    }
}

extension Font {
    public static func Roboto(size: CGFloat, weight: String) -> Font {
        return Font.custom("RobotoSlab-\(weight)", size: size)
    }
}

