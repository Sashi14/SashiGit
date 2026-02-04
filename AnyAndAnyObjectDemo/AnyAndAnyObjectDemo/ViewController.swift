//
//  ViewController.swift
//  AnyAndAnyObjectDemo
//
//  Created by Sashi Jagadam on 04/02/26.
//

import UIKit

class ViewController: UIViewController {
    let val: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*init(val: Int) {
            self.val = val
        }*/
        
        anyExample()
        anyObjectExample()
    }
    
    func anyExample()
    {
        var values: [Any] = []
        values.append(10)
        values.append("MyClass")
        values.append(true)
        values.append([1,2,3,4])
        
        print("Any Example: ")
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
        print("End AnyExample")
    }
    
    func anyObjectExample()
    {
        var objects: [AnyObject] = []
        //objects.append(vc as ViewController)
        objects.append(NSString(string: "Hello"))
        objects.append(100 as AnyObject)
        
        print("AnyObject Example: ")
        for obj in objects
        {
            if let myViewCont = obj as? ViewController{
                print("myViewCont: ", myViewCont.val)
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
        print("End AnyObject Example: ")
    }

}

