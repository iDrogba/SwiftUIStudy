//
//  HomeView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/06.
//
import SwiftUI
import Foundation

struct HomeView: View {
        
    var body: some View {
        NavigationView{
                HomeView_Main()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HomeView_ToolBarItem_NavigationBarLeading()
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HomView_ToolBarItem_NavigationBarTrailing()
                        }
                }.navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct HomeView_Main: View {
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

struct HomeView_ToolBarItem_NavigationBarLeading: View {
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

struct HomView_ToolBarItem_NavigationBarTrailing: View {
    var body: some View{
        HStack(spacing:10){
            Image(systemName: "magnifyingglass")
                .font(.callout)
            
            Image(systemName: "text.justify")
                .font(.callout)
            
            Image(systemName: "bell")
                .font(.callout)
            
        }
    }
}