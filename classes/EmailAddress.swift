//
//  EmailAddress.swift
//  BPI
//
//  Created by Famara Kassama on 22.08.19.
//  Copyright © 2019 apploft GmbH. All rights reserved.
//

import Foundation

struct EmailAddressImpl: EmailAddress {
    private(set) var asString: String

    init(validEmailString: String) {
        self.asString = validEmailString
    }
}
