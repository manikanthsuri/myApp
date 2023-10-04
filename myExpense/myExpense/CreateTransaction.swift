//
//  CreateUser.swift
//  SwiftData-Example
//
//  Created by Priya Talreja on 06/06/23.
//

import SwiftUI

struct CreateTransaction: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var transactionText: String = ""
    @State private var amount: String = ""
    @State private var creationDate: Date = .now
    @State private var remarks: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 5) {
                Text("Transaction Text")
                    .multilineTextAlignment(.leading)
                TextField("Transaction Text", text: $transactionText)
                    .textFieldStyle(.roundedBorder)
            }
            VStack(spacing: 5) {
                Text("Amount")
                TextField("Amount", text: $amount)
                    .textFieldStyle(.roundedBorder)
            }
            VStack(spacing: 5) {
                Text("Remarks")
                TextField("Remarks", text: $remarks)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
        }
        .padding(20)
        .navigationTitle("Add Transaction")
        .toolbar {
            Button(action: {
                let transaction = TransactionModel(transactionText: transactionText, amount: amount, creationDate: creationDate, remarks: remarks)
                modelContext.insert(transaction)
                do {
                    try modelContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    CreateTransaction()
}
