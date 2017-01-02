//: Playground - noun: a place where people can play

import UIKit

class Sum: NSCopying {
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
    
    private init(first: Int, second: Int, cache: [[Int]]) {
        self.firstValue = first
        self.secondValue = second
        resultsCache = cache
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Sum(first: self.firstValue, second: self.secondValue, cache: self.resultsCache)
    }
}

//var calc1 = Sum(first: 0, second: 9).result
//var calc2 = Sum(first: 3, second: 8).result

var prototype = Sum(first:0, second:9)
var calc1 = prototype.result
var clone = prototype.copy() as! Sum
clone.firstValue = 3; clone.secondValue = 8
var calc2 = clone.result

print("Calc1: \(calc1) Calc2: \(calc2)")
