//
//Create a Person class. A Person has a first name, last (or family) name and 0 or
//more phone numbers. The person class should have the following methods
//addPhoneNumber(String,PhoneType) --Adds a string representing phone number with given type, which has default type home
//addPhoneNumber(PhoneNumber) --Add the PhoneNumber.
//phoneNumber(PhoneType)->PhoneNumber? --Returns the person's phone number of the given type. Or nil if number does not exist.
//hasNumber(String) -> Bool --Returns true if person has given phoneNumber.
//

import UIKit

class Person
{
    var firstName: String
    var lastName: String
    var phoneNumber:PhoneNumber = PhoneNumber(phNumber: "", phNumType: phType.init())
    
    init(firstName: String, lastName: String)
    {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(firstName: String, lastName: String, numType:PhoneNumber)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber.phNumber = numType.phNumber.phoneFormat()
        self.phoneNumber.phNumType = numType.phNumType
    }
    
    func addPhoneNumber(num:String) -> PhoneNumber
    {
        self.phoneNumber.phNumber = num.phoneFormat()
        self.phoneNumber.phNumType = phType.init()
        return self.phoneNumber
    }
    
    func addPhoneNumber(num:String,numType:phType) -> PhoneNumber
    {
        self.phoneNumber.phNumber = num.phoneFormat()
        self.phoneNumber.phNumType = numType
        return self.phoneNumber
    }
    
    func hasNumber(num: String) -> Bool
    {
        if num == self.phoneNumber.phNumber
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func phoneNumber(num:phType) -> String?
    {
        if self.phoneNumber.phNumType == num
        {
            return self.phoneNumber.phNumber
        }
        else
        {
            return nil
        }
    }
}

var example = Person(firstName: "Deekshitha", lastName: "Manjunath", numType: PhoneNumber.init(phNumber: "6193395295", phNumType: phType.work))
example.addPhoneNumber(num: "6197488768", numType:phType.mobile)
example.phoneNumber(num: phType.mobile)
example.hasNumber(num: "6197488768")
