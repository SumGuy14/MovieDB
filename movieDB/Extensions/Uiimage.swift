import UIKit

extension UIImageView {

    private static let imageCache = NSCache<NSString, UIImage>()

    func fetchDataFrom(serverUrl: String) {
        guard let url = URL(string: serverUrl) else {
            image = UIImage(systemName: "photo")
            return
        }

        let cacheKey = serverUrl as NSString

        if let cachedImage = UIImageView.imageCache.object(forKey: cacheKey) {
            image = cachedImage
            print("Using cache Image")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    self?.image = UIImage(systemName: "photo")
                }
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self?.image = UIImage(systemName: "photo")
                }
                return
            }

            UIImageView.imageCache.setObject(image, forKey: cacheKey)

            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
