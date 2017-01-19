//
//  Same as digitDistribution2.swift expect that the second count argument is optional, if not specifies the default value is 2
//
//

import UIKit

func digitDistribution2(inputString:[Int],count:Int?=nil) -> [Int:Int]
{
    var dict: [Int:Int] = [ : ]
    let length:Int = inputString.count
    if count != nil
    {
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
    }
    else
    {
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
            if value < 2
            {
                dict.removeValueForKey(key)
            }
        }
    }
    print(dict)
    return dict
}

digitDistribution2([101,20,30])
