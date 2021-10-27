//
//  DropImageDelegate.swift
//  App10-ImagePuzzle
//
//  Created by David Cantú Delgado on 19/10/21.
//

import SwiftUI

struct DropImageDelegate: DropDelegate {
    
    @ObservedObject var imageModel: ImageModel
    var image: Img
    @Binding var currentImage: Img?
    @Binding var isCompleted: Bool
    
    func dropEntered(info: DropInfo) { // Cuando entramos en una vista con onDrop
        print("Entered \(image.image)")
        print("Current \(currentImage!.image)")
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? { // Indica la operación del drop
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool { // Se ejecuta cuando se hace el drop
//        print("Perform \(image.image)")
        
        let fromIndex = imageModel.images.firstIndex { (img) -> Bool in
            return img.id == currentImage?.id
        } ?? 0
        let toIndex = imageModel.images.firstIndex { (img) -> Bool in
            return img.id == image.id
        } ?? 0
        
        if fromIndex != toIndex {
            imageModel.images.swapAt(fromIndex, toIndex)
        }
        
        return true
    }
}
