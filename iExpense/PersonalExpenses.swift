//
//  PersonalExpenses.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import Foundation

class PersonalExpenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]()
}
