//
//  CustomPageControlView.swift
//  Tidoy
//
//  Created by Raul Kevin Aliaga Shapiama on 11/6/24.
//

import UIKit

class CustomPageControlView: UIView {

    private let stackView = UIStackView()
    private var indicators: [UIView] = []
    
    var numberOfPages: Int = 0 {
        didSet {
            configureIndicators()
        }
    }

    var currentPage: Int = 0 {
        didSet {
            updateIndicators()
        }
    }

    var currentPageColor: UIColor = .orange
    var pageIndicatorColor: UIColor = .lightGray

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }

    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10 // Espaciado fijo
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func configureIndicators() {
        // Eliminar indicadores previos
        indicators.forEach { $0.removeFromSuperview() }
        indicators.removeAll()
        
        for i in 0..<numberOfPages {
            let indicator = UIView()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(indicator)
            indicators.append(indicator)
            
            // Tamaño fijo para todos los indicadores
            indicator.widthAnchor.constraint(equalToConstant: 16).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: 6).isActive = true
            
            // Configuración inicial de cada indicador
            if i == currentPage {
                setupCurrentPageLayer(for: indicator)
            } else {
                setupInactivePageLayer(for: indicator)
            }
        }
    }

    private func updateIndicators() {
        for (index, indicator) in indicators.enumerated() {
            if index == currentPage {
                setupCurrentPageLayer(for: indicator)
            } else {
                setupInactivePageLayer(for: indicator)
            }
        }
    }

    private func setupCurrentPageLayer(for indicator: UIView) {
        // Limpia cualquier capa previa
        indicator.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        // Capa para el indicador actual como barra horizontal
        let currentLayer = CALayer()
        currentLayer.backgroundColor = currentPageColor.cgColor
        currentLayer.cornerRadius = 3
        currentLayer.frame = CGRect(x: 0, y: 0, width: 16, height: 6)
        
        indicator.layer.addSublayer(currentLayer)
    }

    private func setupInactivePageLayer(for indicator: UIView) {
        // Limpia cualquier capa previa
        indicator.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        // Capa para los indicadores inactivos como círculos grises
        let inactiveLayer = CALayer()
        inactiveLayer.backgroundColor = pageIndicatorColor.cgColor
        inactiveLayer.cornerRadius = 3
        inactiveLayer.frame = CGRect(x: 5, y: 0, width: 6, height: 6) // Centramos el círculo en el contenedor
        
        indicator.layer.addSublayer(inactiveLayer)
    }
}
