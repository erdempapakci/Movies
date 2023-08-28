//
//  Operators.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

precedencegroup ChainingPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator &>: ChainingPrecedence

@discardableResult
// swiftlint:disable operator_whitespace
func &><T>(left: T, right: (T) -> Void) -> T {
    right(left)
    return left
}
// swiftlint:enable operator_whitespace
