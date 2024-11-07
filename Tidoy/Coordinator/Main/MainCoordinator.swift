//
//  MainCoordinator.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/5/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let onboardingViewController = storyboard.instantiateViewController(withIdentifier: "Onboarding") as! OnboardingViewController
        navigationController.pushViewController(onboardingViewController, animated: false)
    }

}
