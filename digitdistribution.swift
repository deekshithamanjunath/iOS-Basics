//
// function with input an array of integers and returns a dictionary of the distribution of digits in the array of numbers.
//  

import UIKit

func digitDistribution(inputArr:[Int]) -> [Int:Int]
{
    var dict: [Int:Int] = [ : ]
    let length:Int = inputArr.count
    
    for index1 in 0...length-1
    {
        let tempArr = String(inputArr[index1]).characters.map { Int(String($0))! }
        
        for index2:Int in tempArr
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
    print(dict)
    return dict
}


digitDistribution([1013,2511,342])
