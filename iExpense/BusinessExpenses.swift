//
//  BusinessExpenses.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import Foundation

class BusinessExpenses: ObservableObject {
    @Published var businessItems = [ExpenseItem](){
        didSet {
            if let data = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(data, forKey: "Business")
            }
        }
    }
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Business"){
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
                businessItems = decoded
                return
            }
        }
        businessItems = []
    }
}
