//
//  AddView.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var personalExpenditure: PersonalExpenses
    @ObservedObject var businessExpenditure: BusinessExpenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                Picker("Select type", selection: $type){
                    ForEach(types, id: \.self){ type in
                        Text(type)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "INR"))
            }
            .navigationTitle("Add Item")
            .toolbar {
                Button{
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    if(type == "Personal") {
                        personalExpenditure.personalItems.append(item)
                    } else {
                        businessExpenditure.businessItems.append(item)
                    }
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
        AddView(personalExpenditure: PersonalExpenses(), businessExpenditure: BusinessExpenses())
    }
}
