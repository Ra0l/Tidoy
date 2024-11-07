//
//  OnboardingViewController.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/5/24.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingComponentDelegate {
    
    @IBOutlet weak var onboardingView: OnboardingComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        onboardingView.delegate = self

        
        // Configurar el contenido del onboarding
        let onboardingData: [OnboardingPageData] = [
            OnboardingPageData(imageName: "image_1",
                               titleText: "Gateway to Your Adventure",
                               descriptionText: "Enjoy various housing options, from budget to luxury, in Tidoy."),
            OnboardingPageData(imageName: "image_2",
                               titleText: "Discover the Wonders of the World: Let's Explore!",
                               descriptionText: "Book a stay wherever you are, whenever you want."),
            OnboardingPageData(imageName: "image_3",
                               titleText: "The Right Solution for Your Holiday Accommodation",
                               descriptionText: "A stress-free Holiday? Trust your Holiday accommodation to Tidoy!")
        ]
        
        // Asignar los datos al componente
        onboardingView.onboardingData = onboardingData
    }
    
    func didFinishOnboarding() {

    }
}
