//
//  VisitButtonComponent.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class VisitButtonComponent: GenericBaseView<String>{
    
    private lazy var button: UIButton = .init() &>  {
        $0.setTitle("Visit", for: .normal)
        $0.tintColor = .blue
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    override func configureView() {
        super.configureView()
        addSubview(button)
        button.frame = frame
    
    }

}
