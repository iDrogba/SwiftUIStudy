//
//  ContentView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/05.
//

import SwiftUI
import UIKit

struct ContentView: View {

    @State private var tabBarSelection = 1
    
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
        }.accentColor(Color.black)
        .onAppear() {
            UITabBar.appearance().tintColor = .black
        }
           
    }
}

struct LocalLifeView: View {
    // 상단 탭바 가져오기
    // 카테고리
    // 글
    var body: some View{
        NavigationView{
                LocalLifeView_Main()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            LocalLifeView_ToolBarItem_NavigationBarLeading()
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            LocalLifeView_ToolBarItem_NavigationBarTrailing()
                        }
                }.navigationBarTitleDisplayMode(.inline)
            
        }
    }
}
struct LocalLifeView_Main: View{
    
    init() {
        UITableView.appearance().sectionFooterHeight = 5
        UITableView.appearance().sectionHeaderHeight = 0
    }
    
    var body: some View{
        
        List{
            ForEach(0..<10){ _ in
                Section {
                    Text("d")
                }
            }
        }.listStyle(.grouped)

        
    }
}

struct LocalLifeView_ToolBarItem_NavigationBarLeading: View {
    @State private var selectedLocation = 0
    @State private var isArrowUp = true
    @State private var rotateAngle:Double = 0
    var storedLocation = ["공릉 1동","오륜동","잠실 2동"]
    
    
    var body: some View{
        
        HStack(spacing: 0){
            Menu{
                ForEach(0..<storedLocation.count){ index in
                    Button {
                        isArrowUp.toggle()
                        updateRotateAngle()
                        selectedLocation = index
                    } label: {
                        Text("\(storedLocation[index])")
                    }.tag(index)
                    
                }
            } label: {
                Text("\(storedLocation[selectedLocation])")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .onTapGesture {
                isArrowUp.toggle()
                updateRotateAngle()
            }
            .id(selectedLocation)
            
            Text("^")
                .font(.headline)
                .fontWeight(.semibold)
                .rotationEffect(Angle(degrees: rotateAngle))
                .animation(.easeOut, value: isArrowUp)
        }
        
    }
    
    func updateRotateAngle(){
        rotateAngle += 180
    }
}

struct LocalLifeView_ToolBarItem_NavigationBarTrailing: View {
    var body: some View{
        HStack(spacing:10){
            Image(systemName: "magnifyingglass")
                .font(.callout)
            
            Image(systemName: "text.badge.star")
                .font(.callout)
            
            Image(systemName: "bell")
                .font(.callout)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
