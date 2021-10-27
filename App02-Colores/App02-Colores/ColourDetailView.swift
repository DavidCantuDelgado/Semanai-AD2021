//
//  ColourDetailView.swift
//  App02-Colores
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI

struct ColourDetailView: View {
    
    var colour: Colour
    
    var body: some View {
        ZStack {
            colour.colour
        VStack {
            Text(colour.name)
                .font(.largeTitle)
                .foregroundColor(colour.dark ? .white : .black)
        }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle(colour.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(.black, UIColor(Colour.Clouds.colour))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(colour.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Colour.Clouds.colour)
            }
        }
        
    }
}

struct ColourDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColourDetailView(colour: Colour.Alizarin)
    }
}
