//
//  ContentView.swift
//  TVMaze
//
//  Created by Gabriel De Andrade Cordeiro on 10/01/25.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @State private var viewModel = ListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            if let message = $viewModel.errorMessage.wrappedValue, !message.isEmpty {
                Text(message)
                    .padding()
                    .background(.red)
                    .cornerRadius(15)
            }
            
            if $viewModel.isLoading.wrappedValue {
                ProgressView()
            }
            
            List {
                ForEach($viewModel.items) { item in
                    LightningCellView(item.wrappedValue)
                        .alignmentGuide(.listRowSeparatorLeading) { d in
                            d[.leading]
                        }
                }
            }.navigationTitle(NSLocalizedString("app_title", comment: ""))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView()
}
