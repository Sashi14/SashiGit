//
//  SwiftUtility.swift
//  SwiftInObjectiveCExample
//
//  Created by Sashi Jagadam on 06/02/26.
//

import Foundation
import UIKit

//@objc makes Swift visible to Objective-C
@objc class SwiftUtility : NSObject
{
    //@objc required for Objective-C access
    @objc func showMessage()
    {
        print("Hello from Swift")
    }
    
    @objc func addNumbers(a: Int, b: Int) -> Int
    {
        return a + b
    }
    //Example using UIKit
    @MainActor @objc func getWelcomeLabel() -> UILabel
    {
        let label = UILabel()
        label.text = "Welcome from Swift!"
        label.textAlignment = .center
        return label
    }
}
