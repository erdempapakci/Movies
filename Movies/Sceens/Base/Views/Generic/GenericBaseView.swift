//
//  GenericBaseView.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
class GenericBaseView<T>: UIView {
    var data: T?
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureView() {
        
    }
    func setData(value: T?) {
        self.data = value
        configureView()
    }
}
