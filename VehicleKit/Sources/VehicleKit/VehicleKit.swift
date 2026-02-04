// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@MainActor
open class Vehicle{
    @MainActor
    public init() {
        
    }
    open func move(){   //Use in APP and also APP can override
        print("Vehicle is moving")
    }
    
    public func stop(){ //APP can use
        print("Vehicle stopped")
    }
    
    func service(){ //Internal -> APP cannot use
        print("Vehicle serviced")
    }
}
