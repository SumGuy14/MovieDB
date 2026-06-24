//
//  MovieCell.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/24/26.
//

import UIKit

class MovieCell: UITableViewCell {

    let movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .darkGray
        return image
    }()

    let movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    let popularityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    let releaseYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .brown

        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(popularityLabel)
        contentView.addSubview(releaseYearLabel)

        NSLayoutConstraint.activate([

            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImage.widthAnchor.constraint(equalToConstant: 220),
            movieImage.heightAnchor.constraint(equalToConstant: 330),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            movieTitle.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 50),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            popularityLabel.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
            popularityLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 50),
            popularityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            releaseYearLabel.topAnchor.constraint(equalTo: popularityLabel.bottomAnchor, constant: 10),
            releaseYearLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 50),
            releaseYearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadMovieData(movie: Movie) {

        movieTitle.text = "Title: \(movie.title ?? "No title")"

        popularityLabel.text = "Popularity Score: \(movie.popularity ?? 0)"

        let year = movie.releaseDate?.prefix(4) ?? "N/A"
        releaseYearLabel.text = "Release Year: \(year)"

        guard let posterPath = movie.posterPath else {
            movieImage.image = UIImage(systemName: "photo")
            return
        }

        let imageUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"

        movieImage.fetchDataFrom(serverUrl: imageUrl)
    }
}
