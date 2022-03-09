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
        .onAppear() {
            UITabBar.appearance().tintColor = .black
        }
    }
}

struct HomeView_Post_Model: Codable, Identifiable {
    let id: String
    let createdAt: String
    let title: String
    let image: String
    let address: String
    let price: String
}

struct LocalView_Post_Model: Codable, Identifiable {
    let id: String
    let createdAt: String
    let name: String
}

class HomeView_ViewModel: ObservableObject {
    @Published var homeView_Post_Models = [HomeView_Post_Model]()
    
    func netWork_HomeView_Post_Model(){
        
    }
}

struct NetWorkCenter {
            
    func getHomeView_Post_Model(completion: @escaping ([HomeView_Post_Model]) -> Void){
        guard let url = URL(string: "https://62260bc92dfa524018fa721d.mockapi.io/post_danggeun") else { return }
        
        AF.request(url).responseJSON { response in
            print("response : "+"\(response)")

            do {
                let decoder = JSONDecoder()
                switch response.result {

                case .success(_):
                    let result = try decoder.decode([HomeView_Post_Model].self, from: response.data!)
                    
                    completion(result)

                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error : ", parsingError)
            }
        }.resume()
    }
    
    func getLocalView_Post_Model() {
            guard let url = URL(string: "https://62260bc92dfa524018fa721d.mockapi.io/post_localview") else { return }
            print("구현 중")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
