//
//  Contact.swift
//  ContactsServer
//
//  Created by MacBook Pro on 17.11.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation


class Contacts {
    var name: String
    var phoneNumber: String

    
    init(data: JSON) {
        self.name  = data["name"] as! String
        self.phoneNumber   = data["phoneNumber"] as! String
    }
}

extension Contacts: CustomDebugStringConvertible {

    var debugDescription: String {
        "\(name): \(phoneNumber)"
    }
}
