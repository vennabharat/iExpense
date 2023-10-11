//
//  ExpenseItem.swift
//  iExpense
//
//  Created by bharat venna on 09/10/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyCode: String
}
