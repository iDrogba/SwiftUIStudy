//
//  HomeView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/06.
//
import SwiftUI
import UIKit
import Foundation
import Kingfisher

struct HomeView: View {
   
    var body: some View {
        NavigationView{
                HomeView_Main()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HomeView_ToolBarItem_NavigationBarLeading()
                            
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HomeView_ToolBarItem_NavigationBarTrailing()
                        }
                }.navigationBarTitleDisplayMode(.inline)
        }.onAppear(){
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        }
    }
}

struct HomeView_Main: View {
    var body: some View {

        ZStack{
            HomeView_Main_List()
            HomeView_Main_OrangeButton()
        }
    }
}

struct HomeView_Main_List: View {
    @EnvironmentObject var homeView_ViewModel : HomeView_ViewModel
    
    var body: some View{
        GeometryReader{ geometry in
            VStack{
                
                List{
                    ForEach(homeView_ViewModel.homeView_Post_Models){ index in
                        HStack(spacing: 10) {
                            
                            KFImage(URL(string: index.image))
                                .resizable()
                                .cornerRadius(8)
                                .aspectRatio(1, contentMode: .fit)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("\(index.title)")
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .lineLimit(2)
                                    
                                Text("\(index.address) . \(index.createdAt)")
                                    .fontWeight(.thin)
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                Text("\(index.price)$")
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                HStack(spacing: 2){
                                    Spacer()
                                    
                                    HStack(spacing:1){
                                        Image(systemName: "message")
                                            .foregroundColor(.gray)
                                        Text("3")
                                    }
                                    HStack(spacing:1){
                                        Image(systemName: "heart")
                                            .foregroundColor(.gray)
                                        Text("5")
                                    }
                                }.font(.footnote)
                            }
                        }
                        .padding(.vertical, 10.0)
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.width/3,alignment: .leading)
                    }
                }
                .listStyle(InsetListStyle())
                .onAppear(){
                    homeView_ViewModel.netWork_HomeView_Post_Model()
                }
                
            }
        }
    }
}

struct HomeView_Main_OrangeButton: View {
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/8, height: UIScreen.main.bounds.size.width/8, alignment: .center)
                    .foregroundColor(.orange)
                    .background(.white)
                    .padding()
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

struct HomeView_ToolBarItem_NavigationBarTrailing: View {
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
