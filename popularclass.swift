//
//  Given sets consisting of array of classes, the function returns the intersection of all the sets
//
//

import UIKit

func popularClasses(setInput:[Set<String>]) -> String
{
    
    let length = setInput.count
    var comman = setInput[0].intersect(setInput[1])
    
    for index in 1...length-2
    {
        comman = comman.intersect(setInput[index+1])
    }
    return String(comman)
}


let studentA: Set = ["CS101", "CS237", "CS520"]
let studentB: Set = ["CS101", "Math245", "CS237","CS560"]
let studentC: Set = ["CS237", "CS560"]
let studentD: Set = ["CS237", "CS560"]

popularClasses([studentA,studentB,studentC,studentD])
