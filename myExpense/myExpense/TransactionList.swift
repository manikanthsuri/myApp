//
//  ContentView.swift
//  myExpense
//
//  Created by Suri Mani kanth on 30/09/23.
//

import SwiftUI
import SwiftData

struct TransactionList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TransactionModel.creationDate, order: .forward, animation: .smooth) var transactions: [TransactionModel]


    var body: some View {
        VStack {
            if transactions.isEmpty {
               Text("Press 'Add' to add new Transaction")
            } else {
                List(transactions) { transaction in
                    NavigationLink {
                        EditTransaction(transaction: transaction)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(transaction.transactionText)")
                                .fontWeight(.bold)
                                .font(.headline)
                            Text("Amount: \(transaction.amount)")
                                .fontWeight(.regular)
                                .font(.caption)
                            Text("Remarks: \(transaction.remarks)")
                                .fontWeight(.regular)
                                .font(.caption2)
                            
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(transaction)
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            NavigationLink {
                CreateTransaction()
            } label: {
                Text("Add")
            }
        }
    }
}
