//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Akshay Ashok on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background1)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: Notifiaction Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon1, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                ContentView()
            }
            NavigationView {
                ContentView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
