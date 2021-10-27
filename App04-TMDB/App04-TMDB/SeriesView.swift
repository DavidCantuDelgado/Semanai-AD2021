//
//  SeriesView.swift
//  App04-TMDB
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI
import Kingfisher

struct SeriesView: View {
    
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader { geo in
                VStack {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(mediaModel.movies) { movie in
                                NavigationLink(destination: MediaDetailView(media: movie)) {
                                    VStack {
                                        KFImage(URL(string: "\(imageURL)\(movie.poster)"))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width-20)
                                        Text(movie.title)
                                            .font(.title)
                                            .fontWeight(.bold)
                                        Text(movie.release_date)
                                            .font(.headline)
                                        Spacer()
                                    }
                                    .padding(.horizontal,10)
                                }
                            }
                        }
                    })
                }
                .navigationBarTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }

}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
