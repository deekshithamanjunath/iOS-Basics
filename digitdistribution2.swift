//
//  function with two arguments, a string and an Int. The function does the same thing as digitdistribution.swift except the dictionary returns the least count of the digits as specified by the second argument.
//  
//

import UIKit

func digitDistribution(inputString:[Int],count:Int) -> [Int:Int]
{
    var dict: [Int:Int] = [ : ]
    let length:Int = inputString.count
    
    for index1 in 0...length-1
    {
        let arrStr = String(inputString[index1]).characters.map { Int(String($0))! }
        
        for index2:Int in arrStr
        {
            if dict[index2] == nil
            {
                dict[index2] = 1
            }
            else
            {
                dict[index2] = dict[index2]! + 1
            }
        }
    }
    for (key, value) in dict
    {
        if value < count
        {
            dict.removeValueForKey(key)
        }
    }
    print(dict)
    return dict
}

digitDistribution([101,20,30],count:2)
