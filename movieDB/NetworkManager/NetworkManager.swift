import Foundation

protocol MovieNetworkProtocol {
    func fetchDataFromUrl<T: Decodable>(url: String, completion: @escaping (NetworkState<T>) -> Void)
}

final class NetworkManager: MovieNetworkProtocol, Sendable {
    
    static let shared: NetworkManager = NetworkManager()
    private init(){}
    
    func fetchDataFromUrl<T: Decodable>(url: String, completion: @escaping (NetworkState<T>) -> Void) {

        guard let serverURL = URL(string: url) else {
            print("URL Invalid")
            completion(.failure(error: .invalidURL))
            return
        }

        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared

        urlSession.dataTask(with: urlRequest) { data, response, error in

            if error != nil {
                print("Error while fetching movies")
                completion(.failure(error: .serverError))
                return
            }

            guard let data = data else {
                print("Fetched movie data is nil")
                completion(.failure(error: .noData))
                return
            }

            let decoder = JSONDecoder()

            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.successful(data: decodedData))
            } catch {
                print(error)
                completion(.failure(error: .decodingError))
            }
        }
        .resume()
    }
}
