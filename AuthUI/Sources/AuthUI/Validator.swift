//
//  Validator.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import Foundation

public enum Validator {
    public static func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
    
    public static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}
