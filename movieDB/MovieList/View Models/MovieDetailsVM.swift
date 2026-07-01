import Foundation

final class MovieDetailViewModel {

    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var navigationTitle: String {
        return movie.title ?? "Movie Details"
    }

    var titleText: String {
        return "Title: \(movie.title ?? "No title")"
    }

    var overviewText: String {
        return movie.overview ?? "No overview available"
    }

    var detailsText: String {
        return """
        Popularity Score: \(movie.popularity ?? 0)

        Ratings: \(movie.voteAverage ?? 0)/10

        Release Year: \(movie.releaseDate ?? "N/A")

        Vote Count: \(movie.voteCount ?? 0)
        """
    }

    var posterImageUrl: String? {

        guard let posterPath = movie.posterPath else {
            return nil
        }

        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
