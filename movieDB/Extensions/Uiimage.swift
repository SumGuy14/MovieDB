import UIKit

extension UIImageView {

    func fetchDataFrom(serverUrl: String) {

        guard let serverURL = URL(string: serverUrl) else {
            self.image = UIImage(systemName: "photo")
            return
        }

        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared

        urlSession.dataTask(with: urlRequest) { data, response, error in

            if error != nil {
                DispatchQueue.main.async {
                    self.image = UIImage(systemName: "photo")
                }
                return
            }
            
            guard let receivedData = data else {
                DispatchQueue.main.async {
                    self.image = UIImage(systemName: "photo")
                }
                return
            }

            DispatchQueue.main.async {
                self.image = UIImage(data: receivedData)
            }
        }
        .resume()
    }
}
