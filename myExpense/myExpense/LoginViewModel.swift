//
//  LoginViewModel.swift
//  myExpense
//
//  Created by Suri Mani kanth on 01/10/23.
//

import Foundation

class LoginViewModel {
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
