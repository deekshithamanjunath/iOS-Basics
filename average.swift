//
//  a Swift function, with input int argument an array of Ints and returns an optional double average of the inputs. If the input array is empty return the optional value nil.
//

import UIKit

func average(arrInt:[Int]) -> Double?
{
    var sum:Int = 0
    var mean:Double? = 0
    let length = arrInt.count
    
    if length != 0
    {
        for var index in 0...length-1
        {
            sum += arrInt[index]
        }
    }
    else
    {
        return nil
    }
    mean = Double(sum/length)
    print(mean)
    return mean
}

average([10,15,30])
