//
//  Same as average.swift except the input array includes optional values as well
//
//

import UIKit

func average2(arrInt:[Int?]) -> Double?
{
    var cnt = 0
    var mean:Double = 0
    var total = 0
    
    for number in arrInt
    {
        if let number = number
        {
            total += number
            cnt += 1
        }
    }
    if cnt != 0
    {
        mean = Double(total)/Double(cnt)
    }
    else
    {
        return nil
    }
    print(mean)
    return mean
}

average2([10,nil,30])
