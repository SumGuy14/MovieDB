import Foundation

final class MovieListViewModel {

    var movieList: [Movie] = []

    var reloadTableView: (() -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?

    func getMovies() {

        showLoader?()

        NetworkManager.shared.fetchDataFromUrl(url: URLs.movieList.rawValue) { [weak self] movies in

            DispatchQueue.main.async {

                self?.movieList = movies

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
}
