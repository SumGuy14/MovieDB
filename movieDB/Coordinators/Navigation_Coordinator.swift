//
//  Navigation_Coordinator.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/29/26.
//

import UIKit
protocol NavigationCoordinatorDelegate {
    func next(destination: UIViewController)
    func dismiss()
    var navi: UINavigationController? { get set }
}

class NavigationCoordinator: NavigationCoordinatorDelegate{
    weak var navi: UINavigationController?
    init(navi: UINavigationController? = UINavigationController()) {
        self.navi = navi
    }
    
    func next(destination: UIViewController) {
        navi?.pushViewController(destination, animated: true)
    }
    
    func dismiss() {
        navi?.popToRootViewController(animated: true)
    }
    
    
    
}
