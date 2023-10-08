//
//  AddView.swift
//  iExpense
//
//  Created by bharat venna on 08/10/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currencyCode = "INR"
    
    let types = ["Personal", "Business"]
    let currencyArray = ["INR", "AED" , "AUD" , "BZD" , "DKK" , "EUR" , "GBP" , "JPY" , "KES" , "MXN" , "OMR" , "STD" , "USD" , "XCD", "ZWD"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Select type", selection: $type) {
                    ForEach(types, id: \.self) { item in
                        Text(item)
                    }
                }
                HStack{
                    Picker("Select Currency", selection: $currencyCode) {
                        ForEach(currencyArray, id: \.self) { code in
                            Text(code)
                        }
                    }
                    .labelsHidden()
                    Spacer()
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? currencyCode))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add item")
            .toolbar {
                Button {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currencyCode: currencyCode)
                    expenses.items.append(item)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
