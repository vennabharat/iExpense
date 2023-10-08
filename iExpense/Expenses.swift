//
//  Expenses.swift
//  iExpense
//
//  Created by bharat venna on 08/10/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "ExpenseItems")
            }
        }
    }
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "ExpenseItems") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
                items = decoded
                return
            }
        }
        items = []
    }
    
}
