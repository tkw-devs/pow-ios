//
//  ContentView.swift
//  Poq
//
//  Created by Mihai Ionescu on 18/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var poqRepository: PoqRepository
    
    var body: some View {
        GeometryReader {
            geometry in
            NavigationView {
                CustomScrollView(width: geometry.size.width, height: geometry.size.height, poqRepository: self.poqRepository)
                    .navigationBarTitle(Text("Pull To Refresh"), displayMode: .inline)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView().environmentObject(PoqRepository.testData())
        }
    }
}
