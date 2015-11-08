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

//Planet[2] // because there is no static subscript! (why?)

Planet.Mercury[2]


// Inheritance + initializer
// 가장 중요한 사항을 한가지
// "명시적 overriding" 이라는 것(swift, scala 등의 언어의 trend)

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
class Super1 {
    subscript(param:Int)->String {
        return "\(param) is passed to super's subscript"
    }
}

class Subclass1:Super1 {
    //TODO: override super's subscript
}

let subc = Subclass1()
subc[10]

// override property, 그전에 먼저 review:
// 우태균이가 이걸 성의있게 공부했을리가 없어... #내신세야
// swift의 property 문법은 우아하지 못해서 정말 배우기가 싫다

class Super2 {
    /* let 으로는 computed property 선언 못함: 당연한데 왜?
    // computed property의 가장 중요한 특성: (  )
    /
    let property:Int {
        return 10;
    }
    */

    // read only property
    var property01:Int {
        get {
            return 10;
        }
    }
    // getter/setter for stored property?
    // getter/setter가 있다는 것 자체가 computed property 
    // 하지만 이내 곧 무한 루프에 빠지고 말지, 드러븐 swift
    // 이럴꺼면 왜 _ 뺐어
    /*
    var property = 10 {
        set {
    
        }
    }
    */
    
    // property observer for stored property
    // 가능하겠죠? property observer는 stored property에 어울림
    var property02:Int = 10 {
        didSet {
            print("setted!")
        }
        
    }

    // property observer for computed property
    // set도 만들고 didSet도 만든다는 건 좋은 패턴이 아니다

    // get/setter가 있다면 property observer를 붙이지 못한다
    /*
    var property:String {
        get {
            return "Initial Value"
        }
        didSet {
            print("just set");
        }
    }
    */
    
    // 이럴꺼면 왜 _ 없앴어...
    private var _property03:String = "Initial Value"
    var property03:String {
        get {
            return _property03
        }
        set {
            _property03 = newValue
        }
    }
    
    // setter only는 불가능!
    /*
    private var _property:String = "Initial Value"
    var property:String {
        set {
            _property = newValue
        }
    }
    */
}

// 객체 생성의 법칙: 멤버는 (어떤 형태로든) 초기화되어 있어야한다.
let super2 = Super2()
// TODO: _property03 초기화 제거

// 본론: inheritance
// 핵심: 

class Super3 {
    var stored_property01 = 10
    
    var stored_property02 = 20 {
        didSet {
            print("stored_property02 did set")
        }
    }
    
    private var _computed_property01:String = "Initial String"
    
    var computed_property01_readonly:String {
        return _computed_property01
    }
    
    private var _computed_property02:String = "Initial String"
    var computed_property02_readwrite:String {
        get {
            return "\(_computed_property02) in subclass"
        }
        set {
            _computed_property02 = newValue
        }
    }

}

class Subclass3:Super3 {
    // stored propety > stored property
    // override하는게 아니라 재할당하면 된다
    // override var stored_property01 = 20
    /*
    override init() {
        super.init()
        stored_property01 = 20
    }
    */
    
    // stored property > computed property 변경
    override var stored_property01:Int {
        get {
            print("get: actually it's computed now")
            return super.stored_property01 + 100
        }
        set {
            print("set: actually it's computed now")
            super.stored_property01 = newValue
        }
    }
    
    // computed property: 읽기 전용 > 읽기 + 쓰기 변경
    override var computed_property01_readonly:String {
        get {
            return "\(_computed_property01) in subclass"
        }
        set {
            _computed_property01 = newValue
        }
    }
    
    // computed property: 읽기 + 쓰기 > 읽기 전용 (축소)
    // 축소하면 어떤 일이 생기길래 왜 안되는 걸까?
    /*
    override var computed_property02_readwrite:String {
        return _computed_property01
    }
    */
    
    // override property observer
    override var stored_property02:Int {
        didSet {
            print("stored_property02 set again")
        }
    }
    
    // read only property의 property observer (didSet, willSet)상속?
}

var subclass3 = Subclass3()
subclass3.stored_property01

print("----")
var super3:Super3 = Subclass3()    //super 형에 담아서 쓰다

// 담아서 쓸 수 있는 근본 가정은 subclass는 기능이 더 확대되기 때문이다
// advanced: 함수 인자와, 함수 반환 자리는?
super3.stored_property01  = 100
super3.stored_property01
super3.stored_property02

super3.stored_property02 = 30

// preventing override using FINAL

// initializers




