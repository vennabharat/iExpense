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
    @StateObject var businessExpenditure = BusinessExpenses()
    
    @State private var showingSheet = false
    
    func removeItems(at offset: IndexSet) {
        if(personalSection) {
            personalExpenditure.personalItems.remove(atOffsets: offset)
        } else {
            businessExpenditure.businessItems.remove(atOffsets: offset)
        }
    }
    
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
                    if(personalSection){
//                        code for personal expenses
                        ForEach(personalExpenditure.personalItems) { item in
                            Text(item.name)
                            }
                        .onDelete(perform: removeItems)
                    } else {
                        //code for business expenses
                        ForEach(businessExpenditure.businessItems) { item in
                            Text(item.name)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
//                    let pItem = ExpenseItem(name: "bread", type: "Personal", amount: 5.0)
//                    let bItem = ExpenseItem(name: "Team lunch", type: "Business", amount: 60.0)
//                    personalExpenditure.personalItems.append(pItem)
//                    businessExpenditure.businessItems.append(bItem)
                    showingSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddView(personalExpenditure: personalExpenditure, businessExpenditure: businessExpenditure)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
