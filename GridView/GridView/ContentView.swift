//
//  ContentView.swift
//  GridView
//
//  Created by 김상현 on 2022/02/01.
//

import SwiftUI

struct ContentView: View {
    
    var items = Item.dummyData
    @State private var gridType: GridType = GridType.single
    
    var body: some View {
        VStack{
            GridTypePicker(gridType: $gridType)
            
            ScrollView{
                LazyVGrid(columns: gridType.columns, content: {
                    
                        switch gridType {
                            case .single : GridType_Single(items: items)
                            default :
                                ForEach(items){ item in
                                    Image(item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .animation(.default)
                                }
                        }
                    
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GridType_Single: View{
    
    let items : [Item]
    
    var body: some View{
        ForEach(items){item in
            
            ZStack{
                
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .animation(.default)
                
                HStack{
                    VStack{
                        Spacer()
                        Text(item.mainTitle)
                        Text(item.subTitle)
                    }
            
                    Spacer()
                }.padding(10)
                
            }
        }
        
    }
}
