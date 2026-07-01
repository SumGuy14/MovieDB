import Foundation

protocol MovieNetworkProtocol {
    func fetchDataFromUrl(url: String, completion: @escaping ([Movie]) -> Void)
}

final class NetworkManager: MovieNetworkProtocol, Sendable {

    static let shared: NetworkManager = NetworkManager()
    private init(){}

    func fetchDataFromUrl(url: String, completion: @escaping ([Movie]) -> Void) {

        guard let serverURL = URL(string: url) else {
            print("URL Invalid")
            completion([])
            return
        }

        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared

        urlSession.dataTask(with: urlRequest) { data, response, error in

            if error != nil {
                print("Error while fetching movies")
                completion([])
                return
            }

            guard let data = data else {
                print("Fetched movie data is nil")
                completion([])
                return
            }

            let decoder = JSONDecoder()

            do {
                let decodedData = try decoder.decode(Movies.self, from: data)
                completion(decodedData.results)
            } catch {
                print(error)
                completion([])
            }
        }
        .resume()
    }
}
