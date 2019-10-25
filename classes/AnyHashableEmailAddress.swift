//
//  AnyHashableEmailAddress.swift
//  BPI
//
//  Created by Famara Kassama on 27.08.19.
//  Copyright © 2019 apploft GmbH. All rights reserved.
//

import Foundation

public protocol AnyHashableEmailAddressProtocol: EmailAddressCore {}

public struct AnyHashableEmailAddress: AnyHashableEmailAddressProtocol {
    public var asString: String {
        return emailAddress.asString
    }

    init(_ emailAddress: EmailAddressCore) {
        self.emailAddress = emailAddress
    }

    private let emailAddress: EmailAddressCore
}

// MARK: — Hashable

extension AnyHashableEmailAddress: Hashable {}

extension AnyHashableEmailAddressProtocol where Self: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(asString)
    }
}

// MARK: — Equatable
extension AnyHashableEmailAddress: Equatable {
    public static func == (lhs: AnyHashableEmailAddress, rhs: AnyHashableEmailAddress) -> Bool {
        return lhs.isEqualTo(rhs)
    }
}

extension AnyHashableEmailAddressProtocol where Self: Equatable {
    func isEqualTo(_ other: EmailAddressCore) -> Bool {
        guard let otherEmailAddress = other as? Self else { return false }

        return self == otherEmailAddress
    }
}

// MARK: — CustomStringConvertible

extension AnyHashableEmailAddressProtocol where Self: CustomStringConvertible {
    public var description: String {
        return asString
    }
}
