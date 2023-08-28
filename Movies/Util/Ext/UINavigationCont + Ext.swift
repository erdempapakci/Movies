//
//  UINavigationCont + Ext.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

extension UINavigationController {
    enum TitleStyle {
        case light
        case dark
        case custom(color: UIColor, font: UIFont)

        var attributes: [NSAttributedString.Key: Any] {
            switch self {
            case .light:
                return [
                    .foregroundColor: UIColor.white,
                    .font: UIFont.systemFont(ofSize: 34, weight: .bold)
                ]
            case .dark:
                return [
                    .foregroundColor: UIColor.black,
                    .font: UIFont.systemFont(ofSize: 34, weight: .bold)
                ]
            case .custom(let color, let font):
                return [
                    .foregroundColor: color,
                    .font: font
                ]
            }
        }
    }

    func setLargeTitleStyle(_ style: TitleStyle) {
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = style.attributes
    }
}
