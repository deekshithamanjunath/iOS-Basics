//
//  finds the sum of all the multiples of 3 and 5 below an integer N.
//

import UIKit

func sumMultiples_3_5(N: Int) -> Int
{
    var resultSum:Int = 0
    
    for index in 0...N-1
    {
        if (index%3==0 || index%5==0)
        {
            resultSum += index
        }
    }
    if N > 10
    {
        resultSum -= 15
    }
    print(resultSum)
    return resultSum
}

sumMultiples_3_5(20)
