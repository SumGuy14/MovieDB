import Foundation

final class MovieListViewModel {

    private var allMovies: [Movie] = []
    private var movieList: [Movie] = []

    var reloadTableView: (() -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?

    func getMovies() {

        showLoader?()

        NetworkManager.shared.fetchDataFromUrl(url: URLs.movieList.rawValue) { [weak self] movies in

            DispatchQueue.main.async {

                self?.allMovies = movies
                self?.movieList = movies

                print(movies.count)

                self?.reloadTableView?()

                self?.hideLoader?()
            }
        }
    }

    func numberOfMovies() -> Int {
        return movieList.count
    }

    func getMovie(index: Int) -> Movie {
        return movieList[index]
    }

    func filterMovies(searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedSearchText.isEmpty {
            movieList = allMovies
        } else {
            movieList = allMovies.filter { movie in
                movie.title?.localizedCaseInsensitiveContains(trimmedSearchText) == true
            }
        }

        reloadTableView?()
    }
}
