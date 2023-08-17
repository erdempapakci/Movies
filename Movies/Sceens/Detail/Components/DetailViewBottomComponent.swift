//
//  DetailViewBottomComponent.swift
//  Movies
//
//  Created by Erdem on 17.08.2023.
//

import UIKit

final class DetailViewBottomComponent: GenericBaseView<DetailViewPresenter> {
    
    private lazy var visitButton: CustomVisitButtonView = .init() &> {
        $0.backgroundColor = .red
        $0.setTitle("Visit", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(visitButtonClicked), for: .touchUpInside)
    }
    
    private lazy var saveButton: CustomVisitButtonView = .init() &> {
        $0.backgroundColor = .red
        $0.setTitle("Save", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    private lazy var mainStackView: UIStackView = .init(arrangedSubviews: [visitButton, saveButton]) &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
    }

    
    override func configureView() {
        super.configureView()
        addSubview(mainStackView)
        configureConstraints()
    }
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        
        ])
    }
  @objc  private func visitButtonClicked() {
      
        
    }
    @objc  private func saveButtonClicked() {
          
          
      }
    
    
  
}

