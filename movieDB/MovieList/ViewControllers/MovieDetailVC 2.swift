//import UIKit
//
//class MovieDetailVC: UIViewController {
//
//    var selectedMovie: Movie?
//    let scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        return scroll
//    }()
//
//    let contentView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    let posterImageView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        image.clipsToBounds = true
//        return image
//    }()
//
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .yellow
//        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//    let overviewLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//    let detailsLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .lightGray
//        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .brown.withAlphaComponent(0.5)
//        title = selectedMovie?.title ?? "Movie Details"
//
//        setupUI()
//        loadMovieData()
//    }
//
//    func setupUI() {view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//
//        contentView.addSubview(posterImageView)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(overviewLabel)
//        contentView.addSubview(detailsLabel)
//
//        NSLayoutConstraint.activate([
//
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
//
//            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
//
//            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            posterImageView.widthAnchor.constraint(equalToConstant: 150),
//            posterImageView.heightAnchor.constraint(equalToConstant: 230),
//
//            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 30),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//
//            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
//            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//
//            detailsLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 40),
//            detailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            detailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
//        ])
//    }
//
//    func loadMovieData() {
//
//        guard let movie = selectedMovie else {
//            return
//        }
//
//        titleLabel.text = "Title: \(movie.title ?? "No title")"
//
//        overviewLabel.text = movie.overview ?? "No overview available"
//
//        detailsLabel.text = """
//        Popularity Score: \(movie.popularity ?? 0)
//
//        Ratings: \(movie.voteAverage ?? 0)/10
//
//        Release Year: \(movie.releaseDate ?? "N/A")
//
//        Vote Count: \(movie.voteCount ?? 0)
//        """
//
//        guard let posterPath = movie.posterPath else {
//            posterImageView.image = UIImage(systemName: "photo")
//            return
//        }
//
//        let imageUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"
//
//        posterImageView.fetchDataFrom(serverUrl: imageUrl)
//    }
//}
//
