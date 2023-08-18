//
//  DetailOverviewComponent.swift
//  Movies
//
//  Created by Erdem on 17.08.2023.
//

import UIKit
final class DetailOverviewComponent: GenericBaseView<String> {
    

    private lazy var overviewHolder: UILabel = .init() &> {
        $0.text = "Overview"
        $0.textColor = .black
        $0.textAlignment = .left
    }
    private lazy var overview: UILabel = .init() &> {

        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    private lazy var overViewStackView: UIStackView = .init(arrangedSubviews: [overviewHolder, overview]) &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 10
        
        
    }
    override func configureView() {
        super.configureView()
        
        configureConstraints()
        configureData()
    }
    private func configureConstraints() {
        addSubview(overViewStackView)
        
        NSLayoutConstraint.activate([
            overViewStackView.topAnchor.constraint(equalTo: topAnchor),
            overViewStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            overViewStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overViewStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
          
        ])
    }
    private func configureData() {
        overview.text = self.data
       
    }
}
