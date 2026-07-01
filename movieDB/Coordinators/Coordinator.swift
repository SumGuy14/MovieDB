//
//  Coordinator.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/30/26.
//
import UIKit

class Coordinator{
    let navigationController = UINavigationController()
    var navi: NavigationCoordinatorDelegate?
    //function that will create view controller
    func startUp(){
        
        let movieModel = MovieListViewModel()
        let movieListVC = MovieListVC()
        movieListVC.viewModel = movieModel
        navigationController.viewControllers = [movieListVC]
        movieListVC.naviCoor = self
    }
    func moveTo(destination: UIViewController) {
        navigationController.pushViewController(destination, animated: true)
    }
    
    func dismiss() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
