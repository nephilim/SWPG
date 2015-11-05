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

let pos2 = PositionClass() // cannot initialize this
pos2.x = 10
pos2.y = 20

// Structures and Enumerations are Value Types like Int, Double. copied when they are passed around.

// Classes ara Reference Types. 
// ===, !==

// struct? class?
// Array, Dictionary, String 

struct Point {
    var x:Double = 0.0
    var y:Double = 0.0
}

let pt1:Point = Point(x: 10, y: 20)
var pt2 = Point(x: 10, y:20)

// pt1.x = 21
// pt2.x = 11
// pt2.y = 21


// ** Stored property & Computed property
// computed = lazy

struct Circle {
    var center = Point()
    var radius = 0.0
    var area:Double {
        get {
            return M_PI * (radius/2) * (radius/2)
        }
        set(new) {
            
        }
    }
    var length:Double {
        return M_PI * radius
    }
    func mutate() {
        print("선언할수있어 돼지야")
    }
}

var c1 = Circle(center: Point(x: 10, y: 10), radius: 3.0)
c1.radius = 10.0
c1.area

/*
// computed property must have an explicit type. why?
var global {
    get {
        return "global"
    }
}
*/

// Property Observers: willSet(newValue), didSet
var isUpdated:Bool = false
var cached:String {
    get {
        if (isUpdated) {
            return "Updated"
        }
        return "Stored"
    }

}

// 'Type Property'
// no initializer

// type = struct, class, enum
enum SomeEnum {
    static var stored = 1024 {
        didSet {
            print("stored value was set")
        }
    }
    static var computed:Double {
        return NSDate().timeIntervalSince1970
    }
}

SomeEnum.computed
SomeEnum.stored
SomeEnum.stored = 2048


// 'Class Computed Property' for overriding

// class stored property is not yet supported
class SomeClass{
    class var overrideableTypeProperty:Int {
        return 1;
    }
}



// Methods

// named parameter:
// objective-c covention + _ , explicit name

// modifying value types (enum, struct, String) 
//    = self is not mutable
//    mutating


struct MovablePoint1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}


struct MovablePoint2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY:Double) {
        self = MovablePoint2(x:deltaX + x, y: deltaY + y)
    }
}

// set, get, didSet, willSet is (only) for computed property (...)

class Circle2 {
    var center:Point = Point(x: 0.0, y: 0.0)
    var radius:Double = 0.0 {
        didSet {
            self.diameter = radius * 2.0
        }
    }
    
    var diameter:Double = 0.0 {
        didSet {
            self.radius = diameter / 2.0
        }
    }
}

var c2 = Circle2()
c2.center = Point(x:10.0, y:10.0)
// c2.radius = 10.0 //infinite loop begins;;;







