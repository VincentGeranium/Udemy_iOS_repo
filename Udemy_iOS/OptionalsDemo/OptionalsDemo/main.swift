

let myOptional: String?

myOptional = nil

// MARK: - Check for nil value
if myOptional != nil {
    // if 'myOptional is nil' this line just skip
    let text = myOptional!
} else {
    print("myOptional was found to be nil.")
}

// MARK: - Optional Binding using 'if-let' statment
if let safeOptional = myOptional {
    let text: String = safeOptional
    let text2: String = safeOptional
    
    print(text)
} else {
    print("myOptional was found to be nil.")
}

// MARK: - Nil Coalescing Operator

// checks the object, if it's not nil use that value but if it is nil use the provided default value
let text: String = myOptional ?? "I'm the default value."

print(text)

// MARK: - Optional Chaining
struct OptionalStruct {
    var property = 123
    
    func theMethod() {
        print("this is method.")
    }
}

let myOptionalStruct: OptionalStruct?

myOptionalStruct = OptionalStruct()

print(myOptionalStruct?.property)
myOptionalStruct?.theMethod()


