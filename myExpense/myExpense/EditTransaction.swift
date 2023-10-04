//
//  EditUser.swift
//  SwiftData-Example
//
//  Created by Priya Talreja on 06/06/23.
//

import SwiftUI

struct EditTransaction: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var transaction: TransactionModel
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 5) {
                Text("Transaction Text")
                TextField("Transaction Text", text: $transaction.transactionText)
                    .textFieldStyle(.roundedBorder)
            }
            VStack(spacing: 5) {
                Text("Amount")
                TextField("Amount", text: $transaction.amount)
                    .textFieldStyle(.roundedBorder)
            }
            VStack(spacing: 5) {
                Text("Remarks")
                TextField("Remarks", text: $transaction.remarks)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
        }
        .padding(20)
        .navigationTitle("Edit Transaction")
        .toolbar {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Update")
            })
        }
    }
}
