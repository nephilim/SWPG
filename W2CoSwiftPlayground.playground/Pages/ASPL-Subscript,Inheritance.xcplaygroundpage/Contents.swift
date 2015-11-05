import Foundation

// Subscript, set observer review

enum Planet:Int {
    static var isSolarSystem = true {
        didSet {
            print("\(isSolarSystem) is set")
        }
    }
    case Mercury = 1
    case Venus
    case Eart
    
    // not working as we designed, why?
    subscript(index:Int) -> (Planet) {
        get {
            return Planet(rawValue:index)!
        }
    }
}

Planet.isSolarSystem = true;

//Planet[2] // no static subscript
Planet.Mercury[2]


// Inheritance + initializer

class Vehicle {
    var weight: Double = 0.0
    var currentSpeed: Double = 0.0
    var kineticEnergy:Double {
        get {
            return 0.5 * weight * pow(currentSpeed, 2)
        }
    }
    init (currentSpeed:Double) {
        self.currentSpeed = currentSpeed
    }
    
    func start() {
        print("(NO NOISE)");
    }
}

class GasolineVehicle: Vehicle {
    //override var currentSpeed: Double    // cannot override stored prop.
    //var currentSpeed: Double = 0.0
    
    /*
    
    //initializers are not overrided
    var speed: Double
    override var currentSpeed:Double {      //
        get {
            return 0.0
        }
        set {
            speed = newValue
        }
    }
    */
    
    override var kineticEnergy:Double {    // can override computed prop.
        get {
            return 0.0
        }
    }
    
    /*
    func start() {  // explicitly override
        print("BRRRRRR");
    }*/
    
}

let v = Vehicle(currentSpeed: 1.0)

// Super classes' Subscript




