//
//  to check if given nummber is palindrome or not and return the ith palindrome starting from 1.
//  


import UIKit

func isPalindrome(n: Int) -> Int
{
    var number:Int = n
    var counter:Int = 0
    
    func reverse( num:inout Int) -> Int
    {
        var reversed: Int = 0
        while num > 0
        {
            reversed *= 10
            reversed += num % 10
            num /= 10
        }
        return reversed
    }
    for var palinCheck in 1...number
    {
        if palinCheck == reverse(&palinCheck)
        {
            counter += 1
        }
    }
    print(counter)
    return counter
}

isPalindrome(20)
