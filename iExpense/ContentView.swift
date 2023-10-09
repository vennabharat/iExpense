//
//  ContentView.swift
//  iExpense
//
//  Created by bharat venna on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var personalSection = true // property for switching in between sections
    @StateObject var personalExpenditure = PersonalExpenses()
//    @StateObject var businessExpenditure = BusinessExpenses()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Button("Personal"){
                            personalSection = true
                        }
                        .buttonStyle(.bordered)
                        Spacer()
                        Button("Business"){
                            personalSection = false
                        }
                        .buttonStyle(.bordered)
                    }
                }
//                Section{
//                    Text(personalExpenditure.personalItems.)
//                }
                Section{
//                    if(personalSection){
                        //code for personal expenses
                        ForEach(personalExpenditure.personalItems) { item in
                            Text(item.name)
                            }
//                    } else {
//                        //code for business expenses
//                        ForEach(businessExpenditure.businessItems) { item in
//                            Text(item.name)
//                        }
//                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    let pItem = ExpenseItem(name: "bread", type: "Personal", amount: 5.0)
//                    let bItem = ExpenseItem(name: "Team lunch", type: "Business", amount: 60.0)
                    PersonalExpenses().personalItems.append(pItem)
//                    BusinessExpenses().businessItems.append(bItem)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
