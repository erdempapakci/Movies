//
//  GenericButton.swift
//  Movies
//
//  Created by Erdem on 17.08.2023.
//

import UIKit

class GenericButtonView<T>: UIButton {
    var value: T?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButtonView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButtonView()
    }

    func configureButtonView() {
    }

    func setData(value: T?) {
        self.value = value
        configureButtonView()

    }

}
