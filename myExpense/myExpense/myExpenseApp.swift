//
//  myExpenseApp.swift
//  myExpense
//
//  Created by Suri Mani kanth on 30/09/23.
//

import SwiftUI
import SwiftData

@main
struct myExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoginView()
            }
        }
        .modelContainer(for: [TransactionModel.self])
    }
}
