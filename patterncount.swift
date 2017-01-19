//
//  Given a string and a pattern, the function finds the count of the number of times the pattern appears in the String
//  
//

import UIKit

func patternCount(text: String,pattern: String) -> Int
{
    var cnt:Int = 0
    var match:Int = 0
    
    let arrText:String = text
    let characters = Array(arrText.characters)
    
    let arrPattern:String = pattern
    let charac = Array(arrPattern.characters)
    
    let lenText = characters.count
    let lenPattern = charac.count
    
    for index1 in 1...lenText-lenPattern+1
    {
        for index2 in 0...lenPattern-1
        {
            if characters[index2+index1-1] == charac[index2]
            {
                cnt += 1
            }
            if cnt == lenPattern
            {
                match += 1
                cnt = 0
            }
        }
    }
    print(match)
    return match
}

patternCount("abababa", pattern: "aba")
