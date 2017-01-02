//: Playground - noun: a place where people can play

import UIKit

class Sum {
    var resultsCache: [[Int]] = []
    var firstValue:Int = 0
    var secondValue:Int = 0
    
    var result: Int {
        get {
            return firstValue < resultsCache.count && secondValue < resultsCache[firstValue].count ? resultsCache[firstValue][secondValue] : firstValue + secondValue
        }
    }
    
    init(first: Int, second: Int) {
        resultsCache =  [[Int]](repeating:
            [Int](repeating: 0, count:10), count: 10);
        for i in 0..<10 {
            for j in 0..<10 {
                resultsCache[i][j] = i + j;
            }
        }
        self.firstValue = first;
        self.secondValue = second;
    }
}

var calc1 = Sum(first: 0, second: 9).result
var calc2 = Sum(first: 3, second: 8).result

print("Calc1: \(calc1) Calc2: \(calc2)")
