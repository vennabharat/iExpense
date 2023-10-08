//
//  ContentView.swift
//  iExpense
//
//  Created by bharat venna on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingSheet = false
    
    func removeRow(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
    
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
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code:  item.currencyCode))
                            .foregroundColor(returnColor(item.amount))
                            .font(returnFont(item.amount))
                    }
                }
                .onDelete(perform: removeRow)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showingSheet = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingSheet){
                    AddView(expenses: expenses)
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
