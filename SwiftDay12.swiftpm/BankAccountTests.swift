//
//  BankAccountTests.swift
//  SwiftDay12
//
//  Created by Sashi Jagadam on 03/02/26.
//

class BankAccountTests
{
    func runAllTests()
    {
        testDeposit()
        testSuccessfulWithdraw()
        testWithdrawWrontPin()
        testPrivateAccess()
        testFilePrivateAccess()
    }
    
    func testDeposit()
    {
        print("\n------ Test Deposit ------")
        let account = BankAccount(accountNumber: "1212", initialBalance: 1000, pin: 1234)
        account.deposit(amount: 500)
        account.getBalance()
    }
    
    func testSuccessfulWithdraw()
    {
        print("\n------ testSuccessfulWithdraw ------")
        let account = BankAccount(accountNumber: "1212", initialBalance: 1000, pin: 1234)
        account.withdraw(amount: 500, enteredPin: 1212)
        account.getBalance()
    }
    
    func testWithdrawWrontPin()
    {
        print("\n------ testWithdrawWrontPin ------")
        let account = BankAccount(accountNumber: "1212", initialBalance: 1000, pin: 1234)
    }
    
    func testPrivateAccess()
    {
        print("\n------ testPrivateAccess ------")
        let account = BankAccount(accountNumber: "1212", initialBalance: 1000, pin: 1234)
    }
    
    func testFilePrivateAccess()
    {
        print("\n------ testFilePrivateAccess ------")
        let account = BankAccount(accountNumber: "1212", initialBalance: 1000, pin: 1234)
    }
}
