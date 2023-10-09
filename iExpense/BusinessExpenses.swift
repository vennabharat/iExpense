//
//  BusinessExpenses.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import Foundation

class BusinessExpenses: ObservableObject {
    @Published var businessItems = [ExpenseItem]()
}
