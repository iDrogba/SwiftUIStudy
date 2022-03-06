//
//  ContentView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/05.
//

import SwiftUI
import UIKit

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
                Label("채팅", systemImage: "message.circle")
            }.tag(3)
            Text("나의 당근").tabItem {
                Label("나의 당근", systemImage: "person")
            }.tag(4)
        }.accentColor(Color.black)
        .onAppear() {
            UITabBar.appearance().tintColor = .black
            //UITabBar.appearance().unselectedItemTintColor = UIColor.black
        }
           
    }
}
//상단 바 (위치 리스트 버튼, 검색, 카테고리, 알림)

//중고 거래 글 (미리보기 사진, 글 제목, 설명)
struct HomeView: View {
        
    var body: some View {
        NavigationView{
                HomeView_List()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HomeView_ToolBarItem_SelectedLocation()
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack(spacing:10){
                                Image(systemName: "magnifyingglass")
                                    .font(.callout)
                                
                                Image(systemName: "text.justify")
                                    .font(.callout)
                                
                                Image(systemName: "bell")
                                    .font(.callout)
                                
                            }
                        }
                }.navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct HomeView_List: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                List{
                    ForEach(0..<10){ index in
                  
                        HStack(spacing: 10) {

                            Image("999846")
                                .resizable()
                                .cornerRadius(8)
                                .aspectRatio(1, contentMode: .fit)
                                

                            VStack(alignment: .leading, spacing: 3) {
                                Text("워크맨 일본 카세트 플레이 오브제")
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .lineLimit(2)
                                    
                                Text("목동 . 2분 전")
                                    .fontWeight(.thin)
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                Text("100,000"+"원")
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                    
                        }
                        .padding(.vertical, 10.0)
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.width/3,alignment: .leading)

                    }
                }
                .listStyle(InsetListStyle())
                .onAppear(){
                    UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
                }
            }
        }
    }
}

struct HomeView_ToolBarItem_SelectedLocation: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
