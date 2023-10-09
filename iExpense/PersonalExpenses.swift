//
//  PersonalExpenses.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import Foundation

class PersonalExpenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(data, forKey: "Personal")
            }
        }
    }
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Personal"){
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
                personalItems = decoded
                return
            }
        }
        personalItems = []
    }
}
