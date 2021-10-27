//
//  GridView.swift
//  App10-ImagePuzzle
//
//  Created by David Cantú Delgado on 19/10/21.
//

import SwiftUI

struct GridView: View {
    
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        VStack {
            
             ScrollView {
                 LazyVGrid(columns: columns) {
                     ForEach((0...79), id: \.self) {
                         let codepoint = $0 + 0x1f600
                         let codepointString = String(format: "%02X", codepoint)
                         Text("\(codepointString)")
                         let emoji = String(Character(UnicodeScalar(codepoint)!))
                         Text("\(emoji)")
                     }
                 }.font(.largeTitle)
             }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
