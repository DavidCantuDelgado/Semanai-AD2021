//
//  TMDB.swift
//  App04-TMDB
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI

let apikey = "ec511e19406b403cfcd2caf50537830b"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzUxMWUxOTQwNmI0MDNjZmNkMmNhZjUwNTM3ODMwYiIsInN1YiI6IjViZjM1YjEyMGUwYTI2MjY1YzA5MjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BFDSYObw7NAI3JqKeaWgxXRc_MDlQw_7tT4dOGiHxas"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]

let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
