//
//  LogProvidable.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import OSLog

protocol LogProvidable {
    static var logger: Logger { get }
}

extension LogProvidable {
    static var logger: Logger {
        let subsystem = Bundle.main.bundleIdentifier!
        return Logger(subsystem: subsystem, category: String(describing: Self.self))
    }
}
