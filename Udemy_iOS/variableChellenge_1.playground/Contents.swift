import Foundation

var a = 5
var b = 8
var tempStorage = a

a = b
b = tempStorage

print("the value of a = \(a)")
print("the value of b = \(b)")
