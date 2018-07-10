//
//  PhoneFormatter.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/21/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation


struct PhoneFormatter {
    func format(phoneNumber: String) -> String {
        let cleanPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX XX-XX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    
    func getClearNumber(number: String) -> String {
        return number.replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression)
    }
    
    
    
    
}
