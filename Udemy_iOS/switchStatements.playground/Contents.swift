import Foundation

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 81...100:
        print("you love cat.")
    case 41..<80:
        print("you love cat and dog.")
    case ...40:
        print("notting.")
    default:
        print("error")
    }
}

loveCalculator()
