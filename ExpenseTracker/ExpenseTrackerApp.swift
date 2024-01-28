//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Akshay Ashok on 23/01/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
