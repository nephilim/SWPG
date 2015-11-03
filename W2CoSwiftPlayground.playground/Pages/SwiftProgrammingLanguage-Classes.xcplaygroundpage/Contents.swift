//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// struct vs class?

// Unlike objective-C, swift enables you to set sub-properties of a structure property directly.

import UIKit

let view:UIView = UIView()
view.frame.origin.x = 0
view.frame.origin.y = 0

// 

struct PositionStruct {
    var x:Double = 0.0
    var y:Double = 0.0
}

class PositionClass {
    var x:Double = 0.0
    var y:Double = 0.0
}

let pos1 = PositionStruct(x:10.0, y:10.0)
// let pos2 = PositionClass(x:10.0, y:10.0) // cannot initialize this

// Structures and Enumerations are Value Types like Int, Double. copied when they are passed around.

// Classes ara Reference Types. 
// ===, !==

// struct? class?
// Array, Dictionary, String 



