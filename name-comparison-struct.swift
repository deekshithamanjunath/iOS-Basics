//
//Create a Name structure. A name has two parts a first name (also called a given
//name or personal name) and a last name (family or surname). The Name structure should
//implement the Comparable protocol. 
//

import UIKit

struct Name: Comparable
{
    let firstName : String
    let lastName : String
    
    init(_ firstName : String, _ lastName : String)
    {
        self.firstName = firstName
        self.lastName = lastName
        
    }
}

func == (lhs : Name, rhs : Name) -> Bool
{
    if (lhs.firstName == rhs.firstName && lhs.lastName==rhs.lastName)
    {
        return true
    }
    return false
}

func < (lhs : Name, rhs : Name) -> Bool
{
    if (lhs.firstName > rhs.firstName && lhs.lastName > rhs.lastName)
    {
        return true
    }
    return false
}


let person1 = Name.init("deekshitha", "manjunath")
let person2 = Name.init("deekshitha", "manjunath")

person1 == person2
person1 < person2
