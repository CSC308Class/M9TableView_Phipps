import UIKit

/*
 Inheritance: sub class, super class
 sub class can be inherited with all characteristics of super class
 allows single inheritance only.
 
 class sub_class: super_class{
    
 }
 */

class Man{
    var age: Int
    var weight: Double
    
    init(age: Int, weight: Double){
        self.age = age
        self.weight = weight
    }
    
    func display(){
        print("age = \(age) and weight = \(weight)")
    }
}

extension Man{
    
    func sayHello(){
        print("Hello, I am \(age) years old and weigh \(weight) kg")
    }
}

var man: Man = Man(age: 20, weight: 70)

man.display()
man.sayHello()

class Student: Man{
    
    var name: String
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        super.init(age: age, weight: weight)
    }
    
    override func display(){
        print("name: \(name), age: \(age) and weight: \(weight)")
    }
}

var student: Student = Student(name: "John", age: 20, weight: 70)

student.display()

/*
 protocol: Blueprint of properties and methods
 
 protocol: ProtocolName{
    properties
    methods
 }
 
 protocol: -able, datascource, delegate
 */

protocol Runnable{ //1. declare
    var x: Int {get set}
    func run()
}

class Woman: Runnable{ //2. adopt
    //3. conform
    var x: Int = 1
    func run(){
        print("running~")
    }
}

let runner = Woman()
print(runner.x)
runner.run()

protocol SomeProtocol{
    var x: Int{get set}
    func random() -> Int
}

class ProtoBox: SomeProtocol{ //#2
    //#3
    var x: Int = 7
    func random() -> Int{
        return Int.random(in: 0...9)
    }
}

let p = ProtoBox()
print(p.x)
print(p.random())

class Ta: Student{
    
}
 //class:class, protocol, protocol
//class: protocol, protocol, protocol
class Athlete: Man, Runnable{ //#2
    var x: Int = 10
    func run(){
        print("Athelete running with x = \(x)")
    }
    
    
    
    
}

let athlete = Athlete(age: 20, weight: 70)
athlete.display()
athlete.run()

//class: class, protocol, protocol
class PowerStudent: Student, Runnable, SomeProtocol{
    var x: Int = 7
    
    override init(name: String, age: Int, weight: Double){
        super.init(name: name, age: age, weight: weight)
    }
    func run(){
        print("PowerStudent Running. x = \(x)")
    }
    
    //SomeProtocol
    func random() -> Int{
        return Int.random(in: 0...20)
    }
}

let ps = PowerStudent(name: "Alex", age: 19, weight: 60.0)
ps.display()
ps.run()
print(ps.random())

class Jogger: Runnable{
    var x: Int = 8
    func run(){
        print("Jogger running with x = \(x)")
    }
    
}

let jogger: Jogger = Jogger()
jogger.run()

class DualBox: Runnable, SomeProtocol{
    var x: Int = 8
    func run(){
        print("DualBox running with x = \(x)")
    }
    
    func random() -> Int {
        return Int.random(in: 1...100)
    }

}

let dualBox: DualBox = DualBox()
dualBox.run()
print(dualBox.random())

//Challenge Tasks
//1.
class Animal{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sound(){
        print("Some sound...")
    }
    
}

class Dog: Animal{
    
    override func sound(){
        print("\(name) says Woof!")
    }
}

extension Animal{
    func info() -> String{
        
        return "My name is \(name) and I am \(age) years old"
    }
}

let d = Dog(name: "Molly", age: 7)
d.sound()
print(d.info())

//2.
protocol Flyable{
    
    func fly()
}

class Bird: Flyable{
    
    func fly(){
        print("I'm gonna fly")
    }
}

extension Bird{
    
    func land(){
        print("I landed!")
    }
}

let bird = Bird()
bird.fly()
bird.land()

//3.
class Person{
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greet(){
        print("Hello, I am \(name)")
    }
    
}

protocol Workable{
    
    func work()
}

class Teacher: Person, Workable{
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func work(){
        print("I am working as a teacher")
    }
}

let t = Teacher(name: "Jeff")

t.greet()
t.work()

//4.
protocol Drawable{
    func draw()
}

class Shape: Drawable{
    
    func draw(){
        print("I draw a shape")
    }
    
    func area() -> Double{
        return 0
    }
}

class Circle: Shape{
    
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func area() -> Double{
        return radius * radius * .pi
    }
    
    override func draw(){
        print("Circle... Circle... Circle")
    }
}

extension Circle{
    
    func Diameter() -> Double{
        
        return radius * 2 * .pi
    }
}

let s = Shape()

s.draw()
print(s.area())

let c = Circle(radius: 7)
c.draw()
print(c.Diameter())
print(c.area())

protocol Playable{
    
    func play()
}

protocol Scorable{
    
    var score: Int { get set }
}

class GamePlayer: Playable, Scorable{
    
    var score: Int = 0
    
    func play(){
        score = score + 10
    }
}

extension GamePlayer{
    
    func reset(){
        score = 0
    }
}

let gp = GamePlayer()
print(gp.score)

gp.play()
print(gp.score)


gp.play()
print(gp.score)

gp.reset()
print(gp.score)

gp.play()
print(gp.score)
