//
//Part A
//Create an enum with associated values for Currency -
//Currencies: Euro, US Dollar, Indian Rupee, Mexican Peso. 
//Three letter code: EUR, USD, INR, MXN
//Symbol ("\u{20AC}", "\u{24}", "\u{20B9}", "\u{24}")
//Exchange Rate with respect to USD: 0.8904, 1, 66.7, 18.88
//


import UIKit

enum Currency
{
    case Euro
    case USDollar
    case Indian
    case Mexican
}

var curEURO = Currency.Euro
var curUSD = Currency.USDollar
var curINR = Currency.Indian
var curMXN = Currency.Mexican


func code(inputCode:Currency) -> String
{
    switch inputCode
    {
    case .Euro:
        return "EUR"
    case .USDollar:
        return "USD"
    case .Indian:
        return "INR"
    case .Mexican:
        return "MXN"
    }
}


func symbol(inputSymbol:Currency) -> String
{
    switch inputSymbol
    {
    case .Euro:
        return "\u{20AC}"
    case .USDollar:
        return "\u{24}"
    case .Indian:
        return "\u{20B9}"
    case .Mexican:
        return "\u{24}"
    }
}

func exchangeRate(inputRate:Currency) -> Double
{
    switch inputRate
    {
    case .Euro:
        return 0.8974
    case .USDollar:
        return 1
    case .Indian:
        return 66.7
    case .Mexican:
        return 18.88
    }
}

//Part B
//Create a Money struct. The new money instance created requires type of currency and the amount, got by using enum in the previous part. The money instance should not change value once created.
//Each instance of Money needs access to the same instance of a Currency enum to access the same conversion rate. 
//The Money struct needs three methods: +, - and description. Both - and + operate on two Money instances with return type a money instance but if the two instances are of different currencies the result is in the first (left operand) currency. 
//The method description returns a string representation of the money instance. The string starts with the currency symbol, followed by the amount, followed by a space and ends with the three character symbol for the currency. 
//For example $123.12 USD. Do not worry about formatting the amount.
//

struct Money
{
    var amt = 0.0
    var typeCurrency:Currency
}

func convertionRate(input:Money) -> Double
{
    if input.typeCurrency == Currency.Euro
    {
        return input.amt / exchangeRate(inputRate: Currency.Euro)
    }
    else if input.typeCurrency == Currency.USDollar
    {
        return input.amt
    }
    else if input.typeCurrency == Currency.Indian
    {
        return input.amt / exchangeRate(inputRate: Currency.Indian)
    }
    else
    {
        return input.amt / exchangeRate(inputRate: Currency.Mexican)
    }
}

func +(lhsValue:Money, rhsValue:Money) -> Money
{
    if lhsValue.typeCurrency == rhsValue.typeCurrency
    {
        let totalSameCurrency = lhsValue.amt + rhsValue.amt
        return Money(amt:totalSameCurrency, typeCurrency: lhsValue.typeCurrency)
    }
    else
    {
        let lhsidealFomat = convertionRate(input: lhsValue)
        let rhsidealFomat = convertionRate(input: rhsValue)
        let totalUSD = lhsidealFomat + rhsidealFomat
        func conversionRate2(inputUSD:Double) -> Double
        {
            if lhsValue.typeCurrency == Currency.Euro
            {
                return inputUSD * exchangeRate(inputRate: Currency.Euro)
            }
            else if lhsValue.typeCurrency == Currency.USDollar
            {
                return inputUSD
            }
            else if lhsValue.typeCurrency == Currency.Indian
            {
                return inputUSD * exchangeRate(inputRate: Currency.Indian)
            }
            else
            {
                return inputUSD * exchangeRate(inputRate: Currency.Mexican)
            }
        }
        
        let totalLhsCurrency = conversionRate2(inputUSD: totalUSD)
        return Money(amt:totalLhsCurrency, typeCurrency: lhsValue.typeCurrency)
    }
}


func -(lhsValue:Money, rhsValue:Money) -> Money
{
    if lhsValue.typeCurrency == rhsValue.typeCurrency
    {
        let totalSameCurrency = abs(lhsValue.amt - rhsValue.amt)
        return Money(amt:totalSameCurrency, typeCurrency: lhsValue.typeCurrency)
    }
    else
    {
        let lhsidealFomat = convertionRate(input: lhsValue)
        let rhsidealFomat = convertionRate(input: rhsValue)
        let totalUSD = abs(lhsidealFomat - rhsidealFomat)
        func conversionRate2(inputUSD:Double) -> Double
        {
            if lhsValue.typeCurrency == Currency.Euro
            {
                return inputUSD * exchangeRate(inputRate: Currency.Euro)
            }
            else if lhsValue.typeCurrency == Currency.USDollar
            {
                return inputUSD
            }
            else if lhsValue.typeCurrency == Currency.Indian
            {
                return inputUSD * exchangeRate(inputRate: Currency.Indian)
            }
            else
            {
                return inputUSD * exchangeRate(inputRate: Currency.Mexican)
            }
        }
        let totalLhsCurrency = conversionRate2(inputUSD: totalUSD)
        return Money(amt:totalLhsCurrency, typeCurrency: lhsValue.typeCurrency)
    }
}

func description(currencyDesc:Money) -> String
{
    let type:Currency = currencyDesc.typeCurrency
    let amountdescp = String(currencyDesc.amt)
    let codedescp = String(code(inputCode: type))
    let symboldescp = String(symbol(inputSymbol: type))
    let convdescp = String(exchangeRate(inputRate: type))
    let desc = codedescp! + " " + symboldescp! + " " + amountdescp + " @rate " + convdescp + "USD"
    
    return desc
}


let money1:Money = Money(amt: 355,typeCurrency: Currency.Euro)
let money2:Money = Money(amt: 12,typeCurrency: Currency.USDollar)
let result:Money = money1+money2
let result2:Money = money1-money2
let desc1 = description(currencyDesc: money1)
