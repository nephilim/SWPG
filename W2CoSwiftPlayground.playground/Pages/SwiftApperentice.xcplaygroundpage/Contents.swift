//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let number = 10

let coordinate3d:(x:Double, y:Double, z:Double) = (10, 9 ,8);
coordinate3d.x


//let x:Int  = 10

switch (number) {
case let x where x % 2 == 0:
    print("EVEN \(x)")
default:
    print("ODD")
}



// REPL
// "Read - Evaluate - Print" Loop

func printMultiple(mul multiplier: Int, and andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}


var pi:Double = 3.14

func refinePi(inout pi:Double) {
    pi = 3.141592
}

refinePi(&pi)
pi



func twice(f: Double -> Double, x:Double) -> Double {
    return f(f(x))
}

twice({$0 * 2.0}, x: 1.0)

func repeatOp(var times: Int,startAt start:Int ,_ op:()->Void) {
    while ( times > 0) {
        times--;
        op();
    }
}

repeatOp(10, startAt: 2, {()->Void in
    "!"
});

let text:String? =  nil
print(text)

switch(text) {
case .Some(let x):
    print(x)
case .None:
    print("NON")
default:
    print(text)
}




