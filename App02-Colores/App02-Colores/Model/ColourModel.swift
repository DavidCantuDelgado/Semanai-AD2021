//
//  ColourModel.swift
//  App02-Colores
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI

class ColourModel: ObservableObject {
    
    @Published var spanish = [Colour]()
    @Published var flatUI = [Colour]()
    @Published var american = [Colour]()
    
    init() {
        loadColours()
    }
    
    func loadColours() {
        spanish = Colour.spanish
        flatUI = Colour.flatUI
        american = Colour.american
    }
    
}
