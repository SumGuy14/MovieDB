import Foundation

final class MovieListViewModel {

    private var allMovies: [Movie] = []
    private var movieList: [Movie] = []

    var reloadTableView: (() -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    var showError: ((String) -> Void)?

    func getMovies() {

        showLoader?()
        //let complesionhandler: (Result<[Movie], Error>) -> Void =

        NetworkManager.shared.fetchDataFromUrl(url: URLs.movieList.rawValue) { [weak self] (result:NetworkState<Movies>) in
            switch result {
            case .successful(let data):
                DispatchQueue.main.async {
                    self?.allMovies = data.results
                    self?.movieList = data.results

                    print(data.results.count)

                    self?.reloadTableView?()

                    self?.hideLoader?()
                }
            case .failure(let error):
                self?.showError?(error.localizedDescription)
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
