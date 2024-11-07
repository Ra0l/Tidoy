//
//  SplashViewController.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/5/24.
//

import UIKit

class SplashViewController: UIViewController {
    weak var coordinator: SplashCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Simula el tiempo de espera o alguna lógica de inicialización antes de la transición
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.coordinator?.didFinishSplash()
        }
    }

}
