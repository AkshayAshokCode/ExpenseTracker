//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Akshay Ashok on 29/01/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
           VStack {
               List {
                   // MARK: Transaction Groups
                   ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
                       Section {
                           // MARK: Transaction List
                           ForEach(transactions) { transaction in
                               TransactionRow(transaction: transaction)
                           }
                       } header: {
                           // MARK: Transaction Month
                           Text(month)
                       }
                       .listSectionSeparator(.hidden)
                   }
               }
               .listStyle(.plain)
           }
           .navigationTitle("Transactions")
           .navigationBarTitleDisplayMode(.inline)
       }
   }

struct NavigationView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}

