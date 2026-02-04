import SwiftUI


struct ContentView: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .padding()
            .onAppear  {
                runHigherOrderFunction()
            }
        /*VStack {
         Image(systemName: "globe")
         .imageScale(.large)
         .foregroundColor(.accentColor)
         Text("Hello, world!")
         }*/
    }
    
    func runHigherOrderFunction()
    {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
        let optString = ["10", "abc", "30", nil, "40"]
        let nestedArray = [[1,2], [3,4], [5]]
        
        //map: transform elements
        let doubleNumbers = numbers.map { number in number * 2  }
        print(output = "map -> doubled numbers: \(doubleNumbers)")
        
        //filter: select elements
        let evenNumbers = numbers.filter { number in number % 2 == 0}
        print(output = "filter -> even numbers: ", evenNumbers)
        
        //reduce: combine elements
        let concatenatedString = optString.reduce("") { (result, string) in
            guard let string = string else { return result }
            return result + string
        }
        print(output = "reduce -> concatenated string: ", concatenatedString)
        
        let sumOfNumbers = numbers.reduce(0){ (result, number) in result + number}
        print(output = "reduce -> sum of numbers: ", sumOfNumbers)
        
        //compactMap: Remove nil and transform
        let validIntegers = optString.compactMap{value in
            if let stringValue = value {
                return Int(stringValue)
            }
            return nil
        }
        print ("compactMap -> valid integers: ", validIntegers)
        
        //flatMap: Flatten collections
        let flatArray = nestedArray.flatMap{array in array}
        print ("flatMap -> flattened array: ", flatArray)
        
        //sorted: Custom Sorting
        let sortedDecending = numbers.sorted{a, b in a > b }
        print("sorted -> descending: ", sortedDecending)
        
        //forEach: perform action
        print("\n forEach -> print numbers: ")
        numbers.forEach { number in print("Number: \(number)") }
        
        //contains: check condition
        let containsFive = numbers.contains(5)
        //number.contains {number in number == 5}
        print("contains -> does it contain 5? \(containsFive)")
        
        //allSatisfy: all match condition
        let allPositive = numbers.allSatisfy{number in number > 0}
        print("allSatisfy -> all numbers positive? \(allPositive)")
        
        //first(where): find first match
        let firstEven = numbers.first {number in number % 2 == 0}
        print("first(where) -> first even number: ", firstEven ?? "None")
        
        //min / max
        let minNumber = numbers.min() ?? 0
        let maxNumber = numbers.max() ?? 0
        print("min / max -> min: \(minNumber), max: \(maxNumber)")
        
        //lazy: perform optimization
        let lazyResult = numbers.lazy
            .filter{$0 > 2}
            .map{$0 * 10}
        print("lazy -> filtered and mapped: ", lazyResult)
        
        //chaining multiple HOF's (Higher order functions)
        let chainedResult = numbers
            .filter {$0 % 2 != 0}
            .map {$0 * 4}
            .reduce(0, +)
        print("chaining HOF's -> result: \(chainedResult)")
        
        //Custom higher order function
        func operate(
            _ a : Int,
            _ b: Int,
            using operation: (Int, Int) -> Int
        ) -> Int {
            operation(a, b)
        }
        let addition = operate(10, 8) {$0 + $1}
        let multiplication = operate(10, 8) { $0 * $1}
        
        print("\n Custom HOF -> addition: \(addition), multiply: \(multiplication)")
        
    }
}
