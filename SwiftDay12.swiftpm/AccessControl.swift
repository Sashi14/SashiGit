//
//  AccessControl.swift
//  SwiftDay12
//
//  Created by Sashi Jagadam on 03/02/26.
//

public class BankAccount
{
    public let accountNumber: String //public
    private(set) var balance: Double  //read only
    private let pin:Int
    fileprivate var transactionCount = 0 //same file
        
    //initializer
    public init(accountNumber: String, initialBalance: Double, pin: Int) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
        self.pin = pin
    }
    
    //public methods
    public func deposit(amount: Double) {
        guard amount > 0 else {
            print("deposit amount must be positive")
            return
        }
        balance += amount
        transactionCount += 1
        print("Deposited \(amount)")
    }
    
    public func withdraw(amount: Double, enteredPin: Int) {
        guard validatePin(enteredPin) else {
            print("Invalid pin")
            return
        }
        
        guard amount > 0, amount <= balance else {
            print("Insufficient balance")
            return
        }
        balance -= amount
        transactionCount += 1
        print("Withdrawn \(amount)")
    }
    
    public func getBalance()
    {
        print("Balance \(balance)")
    }
    
    //Private methods
    private func validatePin(_ enteredPin: Int) -> Bool {
        return pin == enteredPin
    }
    
    private func resetBalance() {
        balance = 0.0
    }
    
    fileprivate func resetAccont() {
        resetBalance()
        transactionCount = 0
        print("Account reset")
    }
}
