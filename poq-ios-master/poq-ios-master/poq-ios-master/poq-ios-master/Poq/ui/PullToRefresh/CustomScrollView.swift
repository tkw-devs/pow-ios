//
//  CustomScrollView.swift
//  Poq
//
//  Created by Mihai Ionescu on 19/02/2020.
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomScrollView : UIViewRepresentable {
    
    var width : CGFloat
    var height : CGFloat
    
    @State var poqRepository: PoqRepository
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, repository: poqRepository)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
        let childView = UIHostingController(rootView: RepositoryListView(poqRepository: poqRepository))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator: NSObject {
        var control: CustomScrollView
        var repository : PoqRepository
        init(_ control: CustomScrollView, repository: PoqRepository) {
            self.control = control
            self.repository = repository
        }
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            sender.endRefreshing()
            self.repository.getRepositories()
        }
    }
}
