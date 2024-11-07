//
//  SplashCoordinator.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/5/24.
//

import Foundation
import UIKit

class SplashCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = self
        navigationController.setViewControllers([splashViewController], animated: false)
    }

    func didFinishSplash() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
