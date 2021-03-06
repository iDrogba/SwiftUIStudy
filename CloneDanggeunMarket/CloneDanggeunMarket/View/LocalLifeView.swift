//
//  LocalLifeView.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/07.
//

import SwiftUI

struct LocalLifeView: View {
    
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
                }
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear(){
            UIToolbar.appearance().barTintColor = UIColor.white
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
            UITableView.appearance().sectionHeaderHeight = 0
            UITableView.appearance().sectionFooterHeight = 5
        }
    }
}

struct LocalLifeView_Main: View {
    
    var body: some View{
        GeometryReader{ geometry in
            List{
                
                ForEach(0..<20){ index in
                    Section {
                        VStack(alignment: .leading, spacing: 0){
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.size.width/10, height: 20)
                                .foregroundColor(Color(UIColor.systemGray6))
                                .cornerRadius(5)
                                .overlay{
                                    Text("질문")
                                        .font(.caption)
                                        .fontWeight(.ultraLight)
                                }
                            
                            Text("하계동 주짓수 파라에스트라 체육관관비가 궁금한데 관비만 여쭤보기엔 전화 상담이나 디엠이 좀 죄송하더라구요...성인반 관비 혹시 알 수 있을까요")
                                .font(.callout)
                                .fontWeight(.light)
                                .padding(.vertical)
                            
                            HStack{
                                Text("himheys")
                                    .font(.caption)
                                    .fontWeight(.ultraLight)
                                Text("공릉 2동")
                                    .font(.caption)
                                    .fontWeight(.ultraLight)
                                
                                Spacer()
                                
                                Text("30분 전")
                                    .font(.caption)
                                    .fontWeight(.ultraLight)
                            }
                            
                            Spacer()
                            Divider()
                            Spacer()
                        
                            HStack(spacing: 10){
                                HStack(spacing: 5){
                                    Image(systemName: "face.smiling")
                                        .font(.caption)
                                    
                                    Text("공감하기")
                                        .font(.caption)
                                        .fontWeight(.thin)
                                }
                                
                                HStack(spacing: 5){
                                    Image(systemName: "message")
                                        .font(.caption)
                                    
                                    Text("댓글 쓰기")
                                        .font(.caption)
                                        .fontWeight(.thin)
                                }
                            }.foregroundColor(.gray)
                        }
                    }.padding(.vertical, 10.0)
                    .frame(width: geometry.size.width * 0.9)
                }
            }.offset(y: -35)
            .listStyle(.grouped)
        }
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

