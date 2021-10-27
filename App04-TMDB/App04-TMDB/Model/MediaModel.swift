//
//  MediaModel.swift
//  App04-TMDB
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI
import Alamofire

class MediaModel: ObservableObject {
    
    @Published var movies = [Media]()
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        
        let URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
            AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
//                print(json["results"].count)
                
                var media: Media
                for movie in json["results"] {
//                    print(movie.1["title"].stringValue)
                    media = Media(
                        id: movie.1["id"].intValue,
                        title: movie.1["title"].stringValue,
                        overview: movie.1["overview"].stringValue,
                        poster: movie.1["poster_path"].stringValue,
                        release_date: movie.1["release_date"].stringValue,
                        score: movie.1["vote_average"].doubleValue
                    )
                    self.movies.append(media)
                }
                
            }
    }
    
}
