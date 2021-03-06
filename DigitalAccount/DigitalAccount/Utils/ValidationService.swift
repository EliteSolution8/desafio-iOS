//
//  ValidationService.swift
//  DigitalAccount
//
//  Created by Cai on 7/7/22.
//

import Foundation

struct ValidationService {
    
    // a function that will validate username for login
    // it's going to validate for invalid values 3 ~ 19 charactor long
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        
        return password
    }
}

enum ValidationError: LocalizedError {
    
    case invalidValue
    case usernameTooLong
    case usernameTooShort
    case passwordTooLong
    case passwordTooShort
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value"
            
        case .usernameTooLong:
            return "Your username is too long"
            
        case .usernameTooShort:
            return "Your username is too short"
            
        case .passwordTooLong:
            return "Your password is too long"
            
        case .passwordTooShort:
            return "Your password is too short"
        }
    }
    
}
