//
//  File.swift
//  myExpense
//
//  Created by Suri Mani kanth on 30/09/23.
//

import Foundation
import SwiftData

@Model
class TransactionModel {
   
    var transactionText: String
    var amount: String
    var creationDate: Date
    var remarks: String

    init(transactionText: String, amount: String, creationDate: Date = .now,remarks: String) {
        self.transactionText = transactionText
        self.amount = amount
        self.creationDate = creationDate
        self.remarks = remarks
    }
}
