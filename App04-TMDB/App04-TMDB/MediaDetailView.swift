//
//  MediaDetailView.swift
//  App04-TMDB
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI
import Kingfisher

struct MediaDetailView: View {
    
    var media: Media
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            Text(media.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(media.release_date)
                .font(.caption)
            ScrollView(.vertical, showsIndicators: false) {
                Text(media.overview)
                    .font(.body)
                    .multilineTextAlignment(.center)
                KFImage(URL(string: "\(imageURL)\(media.poster)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width-20)
            }
        }
        .padding(.horizontal,10)
        .navigationBarTitle("Movie")
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(media: Media.dummy)
    }
}
