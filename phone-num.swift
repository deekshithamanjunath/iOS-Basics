//
// Part A
//A phone number in this country has 10 digits like 6195946191 or 619JYDN191. It
//is hard to read a phone number formatted like that. One common format is 619-594-6191.
//Add the method phoneFormat to the String class. The method phoneFormat converts
//strings like "6195946191", "619 594 6191", "619 5946191" and "619-594-6191" to
//"619-594-6191". That is all the methods below will return "619-594-6191"
//

import UIKit

extension String
{
    func phoneFormat() -> String
    {
        let outFormat = self.components(separatedBy: .whitespaces)
        var finalString = outFormat.joined(separator: "")
        //let idealFomat1 = idealFomat
        for char in finalString.characters
        {
            if char == "-"
            {
                return finalString
            }
        }
        finalString.insert("-", at: finalString.index(finalString.startIndex,offsetBy:3))
        finalString.insert("-", at: finalString.index(finalString.startIndex,offsetBy:7))
        return finalString
    }
}

var number = "6197488768".phoneFormat()

//Part B
//Create a PhoneNumber structure. A PhoneNumber instance has a number and
//a type. We will use only US phone numbers. A type can be mobile, home, work, main,
//home fax, work fax, pager or other.
//Define an enumeration for phone types.
//The PhoneNumber structure needs to have the following methods.
//It should have an initializer that accepts only the phone number with default typebeing home.
//It also needs an initializer that accepts both a phone number and a phonetype.
//isMobile()-> Bool --Returns true if the phone number is for a mobile phone.
//isLocal() -> Bool --Returns true if the phone number has the area code 619 or 858.
//description() -> String  --A property that returns a string description of the phone number in the format
//"type: number". For example 619 594 6191 is a work number so it would be "work:619-594-6191"
//

enum phType
{
    case mobile
    case home
    case homefax
    case workfax
    case pager
    case other
    case work
    case main
    
    
    init()
    {
        self = .home
    }
}

struct PhoneNumber
{
    var phNumber:String
    var phNumType:phType
}

extension PhoneNumber
{
    
    func isMobile() -> Bool
    {
        if self.phNumType == phType.mobile
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func isLocal() -> Bool
    {
        let areaCode = self.phNumber.substring(to :self.phNumber.index(self.phNumber.startIndex,offsetBy:3))
        if (areaCode == "619" || areaCode == "858")
        {
            return true
        }
        else
        {
            return false
        }
    }
    func description() -> String
    {
        return " \(self.phNumType)" + ": " + "\(self.phNumber.phoneFormat()) "
    }
    
}

let phone:PhoneNumber = PhoneNumber(phNumber: "6197488768", phNumType: phType.mobile)
phone.isMobile()
phone.isLocal()
phone.description()

//Part C
//Add a method asPhoneNumber to the String class. The method takes a string of
//the format "work: 619-594-6191" and returns a PhoneNumber instance with the given types
//and number. If the string is not of the format "type: number" then the method
//asPhoneNumber returns nil
//

extension String
{
    func asPhoneNumber() -> PhoneNumber?
    {
        if let range = self.range(of: ":")
        {
            let fieldType = self[self.startIndex..<range.lowerBound]
            let typePhNum = self[range.upperBound..<self.endIndex]
            switch fieldType
            {
            case "mobile":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.mobile)
                return idealFomat
            case "home":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.home)
                return idealFomat
            case "work":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.work)
                return idealFomat
            case "workfax":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.workfax)
                return idealFomat
            case "main":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.main)
                return idealFomat
            case "homefax":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.homefax)
                return idealFomat
            case "pager":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.pager)
                return idealFomat
            case "other":
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.other)
                return idealFomat
            default:
                let idealFomat:PhoneNumber = PhoneNumber(phNumber: typePhNum, phNumType: phType.home)
                return idealFomat
            }
        }
        else
        {
            return nil
        }
    }
    
}

let ph1:String = "mobile: 619-748-8768"
let ab=ph1.asPhoneNumber()
