//
//  RepositoryListView.swift
//  Poq
//
//  Created by Mihai Ionescu on 19/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import SwiftUI
import Combine

struct RepositoryListView: View {
    
    @ObservedObject var poqRepository: PoqRepository
    
    var body: some View {
        LoadingView(isShowing: self.$poqRepository.loading) {
            List(self.poqRepository.repositories) {
                Row(model: $0)
            }.onAppear {
                self.loadData()
            }.alert(isPresented: self.$poqRepository.hasError) {
                Alert(title: Text("Error"), message: Text("Error retrieving the list of repositories"), primaryButton: .cancel(Text("Ok")), secondaryButton: .default(Text("Retry"), action: {
                    self.loadData()
                }))
            }
        }
    }
    
    func loadData() {
        self.poqRepository.getRepositories()
    }
    
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(poqRepository: PoqRepository.testData())
    }
}

struct Row: View {
    
    @ObservedObject var model:PoqRepositoryModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.name ?? "")
                .font(.title)
            Text(model.description ?? "")
                .font(.body)
        }
    }
}
