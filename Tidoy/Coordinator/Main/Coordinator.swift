//
//  Coordinator.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/5/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
