//
//  ViewController.swift
//  DeferGuardDemo
//
//  Created by Sashi Jagadam on 04/02/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*print("--- Case 1: Invalid Input ---")
        processUser(name: nil)
        
        print("--- Case 2: Valid Input ---")
        processUser(name: "DeferGuardDemo")*/
        
        //copyOnWrite()
        
    }
    
    func processUser(name: String?) {
        print("Process User")
        //use defer for guaranteed cleanup
        defer {
            print("defer: cleanup executed\n")
        }
        //use guard for early exit
        //if condition fails, function exists early
        //before exiting, defer executes
        guard let name = name else {
            print("guard: Name is nil, exiting function")
            return
        }
        
        print("Processing user: \(name)")
    }
    
    func copyOnWrite()
    {
        print("--- Copy on write ---")
        var arrayA = [1, 2, 3, 4] //Create array
        print("arrayA: ", arrayA)
        
        var arrayB = arrayA //assign to another array
        print("arrayB assigned from arrayA: ", arrayB)
        printAddress(arrayA, name: "arrayA")
        printAddress(arrayB, name: "arrayB")
        //Mutate arrayA
        arrayA.append(14)
        print("\nAfter mutating arrayA")
        print("arrayA: ", arrayA)
        print("arrayB: ", arrayB)
        printAddress(arrayA, name: "arrayA")
        printAddress(arrayB, name: "arrayB")
        
        //Mutate arrayB
        arrayB.append(15)
        //Copy happens
        print("\nAfter mutating arrayB")
        print("arrayA: ", arrayA)
        print("arrayB: ", arrayB)
        printAddress(arrayA, name: "arrayA")
        printAddress(arrayB, name: "arrayB")
        
        print("--- End copy on write ---")
    }

    func printAddress(_ array: [Int], name: String)
    {
        array.withUnsafeBufferPointer{
            print("\(name) memory address:", $0.baseAddress!)
        }
    }
    
    public class MyClass
    {
        let val: Int
        init(val: Int) {
            self.val = val
        }
        
        func anyExample()
        {
            var values: [Any] = []
            values.append(10)
            values.append("MyClass")
            values.append(true)
            values.append([1,2,3,4])
            
            for value in values
            {
                switch value {
                    case let intValue as Int:
                    print("Int: ", intValue)
                    case let stringValue as String:
                    print("String: ", stringValue)
                case let boolValue as Bool:
                    print("Bool: ", boolValue)
                case let arrayValue as [Int]:
                    print("Array: ", arrayValue)
                default:
                    print("unknown type")
                }
            }
        }
        
        func anyObjectExample()
        {
            var objects: [AnyObject] = []
            objects.append(MyClass(val: 30))
            objects.append(NSString(string: "Hello"))
            objects.append(100 as AnyObject)
            
            for obj in objects
            {
                if let myClass = obj as? MyClass{
                    print("MyClass: ", myClass.val)
                }
                else if let string = obj as? String
                {
                    print("NSString: ", string)
                }
                else if let intValue = obj as? Int
                {
                    print("Int: ", intValue)
                }
                else
                {
                    print("unknown type")
                }
            }
        }
    }

}

