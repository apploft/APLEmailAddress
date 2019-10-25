//
//  EmailAddressProtocol.swift
//  BPI
//
//  Created by Famara Kassama on 26.08.19.
//  Copyright © 2019 apploft GmbH. All rights reserved.
//

import Foundation

/// Protocol defining the public interface for an EmailAddress. The initializer fails when an invalid emailAddressString was given as input. The instance also contains a property defining a valid EmailString
public protocol EmailAddress: EmailAddressCore, EmailAdressHashable {}

public protocol EmailAddressCore {
    var asString: String { get }
}
public protocol EmailAdressHashable {
    /// - Returns: an equatable wrapper for a emailAddress instance
    func asHashable() -> AnyHashableEmailAddress
}

// MARK: — Hashable
extension EmailAddress {
    public func asHashable() -> AnyHashableEmailAddress {
        return AnyHashableEmailAddress(self)
    }
}

/// EmailAddressDetectorProtocol declars a function that takes a string as input and returns all valid emailAddresses within that string as EmailAddressProtocol.
public protocol EmailAddressDetector {
    init()
    func detectSolely(_ emailString: String) -> EmailAddress?
    func detect(_ emailString: String) -> [EmailAddress]?
}
