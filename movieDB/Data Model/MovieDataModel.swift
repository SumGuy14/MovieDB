//
//  MovieDataModel.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/24/26.
//

import Foundation

struct Movies: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
    //Computed properties
//    var releaseYear: String {
//        String(releaseDate.prefix(4))
//    }
//
//    var formattedPopularity: String {
//        String(format: "%.3f", popularity)
//    }
//
//    var formattedDetailPopularity: String {
//        String(format: "%.2f", popularity)
//    }
//
//    var formattedRating: String {
//        String(format: "%.1f", voteAverage)
//    }
//
