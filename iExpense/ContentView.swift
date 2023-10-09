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
    
    func returnColor(_ value: Double) -> Color {
        if value < 200 && value > 50{
            return .orange
        } else if value > 200 {
            return .red
        } else {
            return .green
        }
        
    }
    
    func returnFont(_ value: Double) -> Font {
        if value < 200 && value > 50{
            return .title2
        } else if value > 200 {
            return .title
        } else {
            return .title3
        }
        
    }
    
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
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "INR"))
                                    .foregroundColor(returnColor(item.amount))
                                    .font(returnFont(item.amount))
                            }
                            }
                        .onDelete(perform: removeItems)
                    } else {
                        //code for business expenses
                        ForEach(businessExpenditure.businessItems) { item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "INR"))
                                    .foregroundColor(returnColor(item.amount))
                                    .font(returnFont(item.amount))
                            }
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
