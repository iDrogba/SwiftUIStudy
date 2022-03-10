//
//  HomeViewModel.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/09.
//

import Foundation
import UIKit

struct HomeView_Post_Model: Codable, Identifiable {
    let id: String
    let createdAt: String
    let title: String
    let image: String
    let address: String
    let price: String
}

class HomeView_ViewModel: ObservableObject {
    @Published var homeView_Post_Models = [HomeView_Post_Model]()
    
    func netWork_HomeView_Post_Model(){
        NetWorkCenter().getHomeView_Post_Model { results in
            self.homeView_Post_Models = results }
    }
    
}
