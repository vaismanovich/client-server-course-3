//
//  Account.swift
//  client-server-3
//
//  Created by Vitaliy on 20/06/2021.
//

import Foundation


final class Account {
    
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
}
