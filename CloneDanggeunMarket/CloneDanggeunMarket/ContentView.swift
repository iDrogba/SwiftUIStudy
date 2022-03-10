//
//  ContentView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/05.
//

import SwiftUI
import UIKit

struct UISet {
    var UITableView_appearance_separatorInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    var UITableView_appearance_sectionHeaderHeight = 0.0
    var UITableView_appearance_sectionFooterHeight = 5.0
    var UITableView_Appearance_ContentInset_Top = 0.0
}

struct ContentView: View {
    @State private var UITableView_Appearance_ContentInset_Top: CGFloat = 0
    @State private var tabBarSelection = 0

    var body: some View {
        TabView(selection: $tabBarSelection) {
            
            HomeView(UITableView_Appearance_ContentInset_Top: $UITableView_Appearance_ContentInset_Top).tabItem {
                Label("홈", systemImage: "house")
            }
            .tag(0)
            
            LocalLifeView(UITableView_Appearance_ContentInset_Top: $UITableView_Appearance_ContentInset_Top).tabItem {
                Label("동네생활", systemImage: "newspaper")
            }
            .tag(1)
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
//        .onChange(of: tabBarSelection) { _ in
//            if tabBarSelection == 1 {
//                print("1")
//                UITableView_Appearance_ContentInset_Top = -35
//            } else {
//                print("2")
//                UITableView_Appearance_ContentInset_Top = 0
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
