//
//  ViewController.swift
//  movieDB
//
//  Created by Sumedh Kulkarni on 6/29/26.
//

import UIKit

class ViewController: UIViewController {
    var naviCoor: Coordinator?
    var redRandom: Double
    var greenRandom: Double
    var blueRandom: Double
    var count = 0
    init(){
        redRandom = .random(in: 0...1)
        greenRandom = .random(in: 0...1)
        blueRandom = .random(in: 0...1)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nextButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .selected)
        button.backgroundColor = .white
        
        return button
    }()
    let rootButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Root", for: .normal)
        button.backgroundColor = .white
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: redRandom, green: greenRandom, blue: blueRandom, alpha: 1)

        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        view.addSubview(nextButton)
        view.addSubview(rootButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 150)
        ])
        nextButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        rootButton.addTarget(self, action: #selector(rootScreen), for: .touchUpInside)
    }
    
    @objc func nextScreen(){
        let nextVC = ViewController()
        count+=1
        nextVC.count = count
        nextVC.naviCoor = naviCoor
        if count < 5 {
            naviCoor?.moveTo(destination: nextVC)
        }
    }
    @objc func rootScreen(){
        naviCoor?.dismiss()
    }
}

