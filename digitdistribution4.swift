//
//  Function digitDistribution4 with argument that provides the least number of count for any digit. digitDistribution4 returns a function. The return function gives array of integers which has a dictionary of the distribution of digits in the array of numbers. But as in digitDistribution2 it only contains the digits that occur as many times as the argument to digitDistribution4.
//  
//

import UIKit

func digitDistribution3(count:Int) -> [Int] -> [Int:Int]
{
    func digitDistribution(num:[Int]) -> [Int:Int]
    {
        var output1: [Int:Int] = [ : ]
        var output2: [Int:Int] = [ : ]
        let length:Int = num.count
        
        for index1 in 0...length-1
        {
            var arrStr = String(num[index1]).characters.map { Int(String($0))!
            }
            for var index2:Int in arrStr
            {
                
                if output1[index2] == nil
                {
                    output1[index2] = 1
                    
                }
                else
                {
                    output1[index2] = output1[index2]! + 1
                }
            }
            
        }
        for (key,value) in output1
        {
            if value >= count
            {
                output2[key] = value
            }
        }
        print(output2)
        return output2
    }
    return digitDistribution
    
}

let testA = digitDistribution3(2)
testA([112, 24, 15])
testA([111, 42, 4005])
