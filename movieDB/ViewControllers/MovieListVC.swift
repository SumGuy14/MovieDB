//
//  ViewController.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/24/26.
//



import UIKit

class MovieListVC: UIViewController {

    let movieTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    let viewModel = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "The Movies"
        view.backgroundColor = .brown

        movieTable.dataSource = self
        movieTable.delegate = self

        setupUI()
        bindViewModel()
        viewModel.getMovies()
    }

    func setupUI() {

        view.addSubview(movieTable)
        view.addSubview(activityIndicator)

        movieTable.rowHeight = UITableView.automaticDimension
        movieTable.estimatedRowHeight = 350
        movieTable.separatorColor = .blue

        movieTable.register(
            MovieCell.self,
            forCellReuseIdentifier: CellNames.movieCell.rawValue
        )

        NSLayoutConstraint.activate([

            movieTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func bindViewModel() {

        viewModel.showLoader = { [weak self] in
            self?.activityIndicator.startAnimating()
        }

        viewModel.hideLoader = { [weak self] in
            self?.activityIndicator.stopAnimating()
        }

        viewModel.reloadTableView = { [weak self] in
            self?.movieTable.reloadData()
        }
    }
}

extension MovieListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfMovies()
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: CellNames.movieCell.rawValue,
            for: indexPath
        ) as? MovieCell

        let movie = viewModel.getMovie(index: indexPath.row)

        cell?.loadMovieData(movie: movie)

        return cell ?? UITableViewCell()
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        let selectedMovie = viewModel.getMovie(index: indexPath.row)
        let detailVC = MovieDetailVC()
        let detailModel = MovieDetailViewModel(movie: selectedMovie)
        detailVC.viewModel = detailModel
        //detailVC.viewModel.movieList = detailModel

        navigationController?.pushViewController(detailVC, animated: true)
    }
}
