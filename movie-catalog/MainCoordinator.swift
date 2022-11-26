//
//  MainCoordinator.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        navigationController = UINavigationController()
//        navigationController?.navigationBar.backgroundColor = .systemYellow
        navigationController?.navigationBar.tintColor = .white
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let coordinator = MovieGridCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
}
