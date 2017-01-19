//
////Create a ContactList class. Internally the ContactList maintains one list of your contacts.
//Your class should have at least the following methods.
//addPerson(Person) --Add a Person object to the list.
//orderedByName() -> Array --Returns an Array of all your contacts ordered by last name.
//phoneNumberFor(String) -> PhoneNumber? --Given the lastName return phone numbers for the first person in the list that has
//that last name. Return nil if no such person exists.
//nameForNumber: (String) -> Person? --Return the person with the given phone number. Return nil if no one has the
//phone number.
//

import UIKit

class Person1
{
    var firstName: String
    var lastName: String
    var phoneNumber:PhoneNumber = PhoneNumber(phNumber: "", phNumType: phType.init())
    
    init(firstName: String, lastName: String)
    {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(firstName: String, lastName: String, phoneNumber:PhoneNumber)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}


class ContactList
{
    var list:[Person1] = []
    
    func addPerson(newPerson: Person1) -> Void
    {
        self.list.append(newPerson)
        
    }
    
    func orderedByName() -> [Person1]
    {
        let sorting = self.list.sorted{ $1.lastName > $0.lastName }
        return sorting
    }
    
    func nameForNumber(numOfPerson:String) -> Person1?
    {
        let personPhNum = self.list.filter{ $0.phoneNumber.phNumber == numOfPerson }.first
        if personPhNum?.phoneNumber.phNumber == numOfPerson
        {
            return personPhNum!
        }
        return nil
    }
    
    func phoneNumberFor(lastnamePerson:String) -> PhoneNumber?
    {
        
        let respectiveNumber = self.list.filter{ $0.lastName == lastnamePerson }.last
        if respectiveNumber?.lastName == lastnamePerson
        {
            return respectiveNumber!.phoneNumber
        }
        return nil
    }
}

var phonebook = ContactList()

var peep1 = Person1.init(firstName: "sam", lastName: "john", phoneNumber: PhoneNumber.init(phNumber: "8489387892", phNumType: phType.mobile))
var peep2 = Person1.init(firstName: "julia", lastName: "roberts", phoneNumber: PhoneNumber.init(phNumber: "6193987295", phNumType: phType.mobile))
var peep3 = Person1.init(firstName: "deekshitha", lastName: "manjunath", phoneNumber: PhoneNumber.init(phNumber: "6197488768", phNumType: phType.mobile))

phonebook.addPerson(newPerson: peep1)
phonebook.addPerson(newPerson: peep2)
phonebook.addPerson(newPerson: peep3)
//print(item.list.firstName)

phonebook.orderedByName()
dump(phonebook.list)
dump(phonebook.phoneNumberFor(lastnamePerson: "manjunath"))

dump(phonebook.nameForNumber(numOfPerson: "6197488768"))
