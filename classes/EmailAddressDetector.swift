//
//  EmailAddressDetector.swift
//  BPI
//
//  Created by Famara Kassama on 22.08.19.
//  Copyright © 2019 apploft GmbH. All rights reserved.
//

import Foundation

public struct EmailAddressDetectorImpl: EmailAddressDetector {
    public init() {}

    public func detect(_ emailString: String) -> [EmailAddress]? {
        let emailAddresses = extractEmailAddresses(emailString)
        let validEmailAddresses: [EmailAddress]? = emailAddresses.compactMap({ EmailAddressImpl(validEmailString: $0) })

        return validEmailAddresses
    }

    public func detectSolely(_ emailString: String) -> EmailAddress? {
        let emailAddresses = detect(emailString)

        if emailAddresses?.count == 1, let emailAddress = emailAddresses?.first?.asString {
            let emailSplit = emailString.replacingOccurrences(of: emailAddress, with: "")
            if emailSplit == "" {
                return EmailAddressImpl(validEmailString: emailAddress)
            }
        }
        return nil
    }

    private func extractEmailAddresses(_ emailAddressString: String) -> [String] {
        var addresses = [String]()
        if let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) {
            let matches = detector.matches(in: emailAddressString, options: [], range: NSRange(location: 0, length: emailAddressString.count))
            for match in matches {
                if let matchURL = match.url,
                    let matchURLComponents = URLComponents(url: matchURL, resolvingAgainstBaseURL: false),
                    matchURLComponents.scheme == "mailto" {
                    let address = matchURLComponents.path
                    addresses.append(String(address))
                }
            }
        }
        return addresses
    }
}
