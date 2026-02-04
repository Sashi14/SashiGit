//
//  Untitled.swift
//  BankAccountExceptions
//
//  Created by Sashi Jagadam on 03/02/26.
//

import Foundation

enum BankError: Error {
    case invalidBankName
    case invalidCustomerID
    case invalidPassword
}

struct BankAccount {

    let bankName: String
    let customerID: String
    private let password: String

    init(bankName: String, customerID: String, password: String) throws {
        guard bankName == "SwiftBank" else {
            throw BankError.invalidBankName
        }

        guard customerID.count == 6 else {
            throw BankError.invalidCustomerID
        }

        guard password.count >= 8 else {
            throw BankError.invalidPassword
        }

        self.bankName = bankName
        self.customerID = customerID
        self.password = password
    }

    func login(with inputPassword: String) throws {
        guard inputPassword == password else {
            throw BankError.invalidPassword
        }
        print("Login successful for customer ID: \(customerID)")
    }
}

