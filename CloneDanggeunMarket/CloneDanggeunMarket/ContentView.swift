//
//  ContentView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/05.
//

import SwiftUI

struct ContentView: View {
   
    @State private var tabBarSelection = 0
    
    var body: some View {
        
        TabView(selection: $tabBarSelection) {
            
            HomeView().tabItem {
                Label("홈", systemImage: "house")
            }.tag(0)
            
            Text("동네생활").tabItem {
                Label("동네생활", systemImage: "newspaper")
            }.tag(1)
            Text("내 근처").tabItem {
                Label("내 근처", systemImage: "mappin.and.ellipse")
            }.tag(2)
            Text("채팅").tabItem {
                Label("채팅", systemImage: "message")
            }.tag(3)
            Text("나의 당근").tabItem {
                Label("나의 당근", systemImage: "person")
            }.tag(4)
        }.accentColor(Color.black)
        
    }
}
//상단 바 (위치 리스트 버튼, 검색, 카테고리, 알림)

//중고 거래 글 (미리보기 사진, 글 제목, 설명)
struct HomeView: View {
    
    @State private var selectedLocation = 1
    var storedLocation = ["공릉 1동","오륜동","잠실 2동"]
        
    var body: some View {
        NavigationView{

        
            VStack{
                Color.gray
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Picker(selection: $selectedLocation) {
                        ForEach(0..<storedLocation.count){ index in
                            Text("\(storedLocation[index])")
                                .tag(index)
                        }
                        
                    } label: {
                        Text("\(storedLocation[selectedLocation])")
                            .font(.largeTitle)
                        
                    }.pickerStyle(MenuPickerStyle())
                }
            }
           
            
        }.navigationBarTitleDisplayMode(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
