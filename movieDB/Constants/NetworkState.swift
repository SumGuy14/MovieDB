enum NetworkError: String, Error  {
    case invalidURL = "Invalid URL"
    case noData = "No Data Received From Server"
    case decodingError = "Decoding Error"
    case serverError = "Server Error"
}

enum NetworkState<T> {
    //case loading
    case successful(data: T)
    case failure(error: NetworkError)
}
