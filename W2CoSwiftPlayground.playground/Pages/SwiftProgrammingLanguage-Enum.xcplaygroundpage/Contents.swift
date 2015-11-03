//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// ## Enumerations


// enum case + switch case
enum Direction {
    case North, South, East, West
    case NorthEast
}


// Type Inference
var dir = Direction.North;


dir = .South    // known type, 알려진 타입

switch (dir) {
case Direction.North:
    print("북쪽")
    default:
    print("딴쪽")
}

import CoreLocation

// Associated Values
enum VLOCellType {
    case PhotoCell(count:Int, url:NSURL)
    case LocationCell(String, lat:Double, lng:Double)
}

var cellType:VLOCellType = .LocationCell("아비뉴프랑", lat: 37.3484, lng: 127.0485)

switch cellType {
case .PhotoCell(count: 10, _):
    print("photo cell size 10")
case let .LocationCell(title, lat, lng) where lat == 37.3484:
    print("Location cell of '\(title)'")
default:
    print("i dont know")
}


// Raw Value

enum KoreanPlanetName:String {
    case Mercury = "수성"
    case Venus = "금성"
}

KoreanPlanetName.Mercury.rawValue
KoreanPlanetName.Mercury

//enum VLONumberedCellTypeFaulted { // Raw Type 필요
//    case Note = 1, Quote
//    case Photo, Location, Route
//}


// implicitly
enum VLONumberedCellType:Int {
    case Note = 2, Quote
    case Photo, Location, Route
}

VLONumberedCellType.Photo
VLONumberedCellType.Photo.rawValue

enum PlanetName:String {
    case Mercury, Venus, Earth
}

PlanetName.Mercury
PlanetName.Mercury.rawValue

// rawValue 로 만들기 
let earth = PlanetName(rawValue: "Earth")
let photoCell = VLONumberedCellType(rawValue:4)

// RecursivDoublee Enums
// [#Image(imageLiteral: "스크린샷 2015-11-03 00.34.26.png")#]


