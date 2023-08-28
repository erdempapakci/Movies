//
//  ViewBuilderProtocol.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

protocol ViewBuilderProtocol {
    static func build() -> UIViewController
}

protocol DetailViewBuilderProtocol {
    // swiftlint:disable identifier_name
    static func build(with ID: String) -> UIViewController
}
// swiftlint:enable identifier_name
