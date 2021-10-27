//
//  ContentView.swift
//  App10-ImagePuzzle
//
//  Created by David Cantú Delgado on 19/10/21.
//

    import SwiftUI
    import MobileCoreServices

struct ImagePuzzleView: View {
    
    @StateObject var imageModel = ImageModel()
    @State var shuffled: Bool = false
    @State var currentImage: Img? = nil
    @State var isCompleted: Bool = true
    
    var columns: [GridItem] =
    Array(repeating: .init(.flexible(), spacing: 0), count: 4)
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Button {
                        imageModel.images.shuffle()
                        shuffled = true
                        isCompleted = false
                    } label: {
                        HStack {
                            Image(systemName: "shuffle.circle.fill")
                                .font(.largeTitle)
                                
                            Text("Shuffle")
                                .font(.largeTitle)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(20)
                    }
                    .padding(.vertical,20)
                    

                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(imageModel.images) { image in
                            Image(image.image)
                                .resizable()
                                .frame(width: (geo.size.width-20)/4, height: (geo.size.width-20)/4)
                                .overlay(
                                    Rectangle()
                                        .stroke(.black, lineWidth: isCompleted ? 0 : 1)
                                )
                                .onDrag {
                                    
                                    print(image.image)
                                    currentImage = image
                                    
                                    return NSItemProvider(item: .some(URL(string: image.image)! as NSSecureCoding), typeIdentifier: String(kUTTypeURL))
                                }
                                .onDrop(of: [.url], delegate: DropImageDelegate(imageModel: imageModel, image: image, currentImage: $currentImage, isCompleted: $isCompleted))
                        }
                    }
                    .padding(.horizontal,10)
                    if shuffled {
                        Image(imageModel.originalImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: (geo.size.width-20)/2, height: (geo.size.width-20)/2)
                            .padding(.top,20)
                    }
                    Spacer()
                        
                }
                .navigationBarTitle("Image Puzzle", displayMode: .inline)
            }
        }
        
    }
}

struct ImagePuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePuzzleView()
    }
}
