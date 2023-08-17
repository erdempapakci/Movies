//
//  CustomButtonView.swift
//  Movies
//
//  Created by Erdem on 17.08.2023.
//

import UIKit
class CustomVisitButtonView: GenericButtonView<DetailViewPresenter> {
    
    
    override func configureButtonView() {
        super.configureButtonView()
        setupButton()
    }
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = .white
        titleLabel?.font     = .systemFont(ofSize: 10)
        layer.cornerRadius   = 25
        layer.borderWidth    = 3.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    private func shake() {
        let shake           = CABasicAnimation(keyPath: "shake")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "shake")
    }
    
}


