//
//  ContentView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/05.
//

import SwiftUI
import UIKit
import Alamofire

struct ContentView: View {
    @State private var tabBarSelection = 0

    var body: some View {
        TabView(selection: $tabBarSelection) {
            
            HomeView().tabItem {
                Label("홈", systemImage: "house")
            }.tag(0)
            
            LocalLifeView().tabItem {
                Label("동네생활", systemImage: "newspaper")
            }.tag(1)
            Text("내 근처").tabItem {
                Label("내 근처", systemImage: "mappin.and.ellipse")
            }.tag(2)
            Text("채팅").tabItem {
                Label("채팅", systemImage: "message.circle")
            }.tag(3)
            Text("나의 당근").tabItem {
                Label("나의 당근", systemImage: "person")
            }.tag(4)
        }
        .accentColor(Color.black)
        .onAppear() { UITabBar.appearance().tintColor = .black }
    }
}

struct HomeView_Post_Model: Codable, Identifiable {
    var id: Int?
    var createdAt: String?
    var name: String?
    var image: String?
    var address: String?
    var price: String?
}

class HomeView_ViewModel: ObservableObject {
    var homeView_Post_Model = [HomeView_Post_Model]()
    
    func netWork_HomeView_Post_Model(){
        
    }
}

struct NetWorkCenter {
    let baseAddress = "https://62260bc92dfa524018fa721d.mockapi.io"
    
    func netWork(select: SelectModel){
        let url = makeUrl(select: select)
        AF.request(url, method: .get).responseJSON { response in
            
        }
    }
    
    enum SelectModel {
        case HomeView_Post_Model
        case LocalView_Post_Model
    }
    
    func makeUrl(select : SelectModel) -> URL {
        switch select {
        case .HomeView_Post_Model:
            return URL(string: baseAddress + "/post_dangguen")!
        
        case .LocalView_Post_Model:
            return URL(string: baseAddress + "/post_localview")!
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
