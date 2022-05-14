protocol CanFly {
    func fly()
}


class Bird {
    
    var isFemale = true
    
    func layEgg() {
        print("The bird makes a new bird in a shell.")
    }
}

class Eagle: Bird, CanFly {
    
    func fly() {
        print("The eagle flaps its wings and lift off the into the sky.")
    }
    
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
    
}

class Penguin: Bird {
    
    func swim() {
        print("The Penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let myAirplane = Airplane()
let myEagle = Eagle()
let myPenguin = Penguin()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myAirplane)
