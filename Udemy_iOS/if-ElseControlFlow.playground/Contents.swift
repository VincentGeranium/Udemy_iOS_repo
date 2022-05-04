import Foundation

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore == 100 {
        print("You love cat")
    } else {
        print("You don't love cat")
    }
}

func loveCalculator2() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore > 80 {
        print("you love cat.")
    } else if loveScore > 40 {
        print("you like cat and dog.")
    } else {
        print("notting.")
    }
}

loveCalculator2()
