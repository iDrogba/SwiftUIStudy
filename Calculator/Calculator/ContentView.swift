//
//  ContentView.swift
//  Calculator
//
//  Created by 김상현 on 2022/03/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var geometryCircleHeight : CGFloat = 50
    
    let data = [
        ["AC","+-","%","/"],
        ["7","8","9","*"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".","="]
    ]
    
    var body: some View {
        VStack(spacing:10){
        
            Spacer(minLength: 50)
            
            Text("????")
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width , alignment: .trailing)
            
            ForEach(0..<4){ indexI in
                HStack(spacing: 10){
                    ForEach(0..<4){ indexJ in
                        
                        CalculationButton(buttonName: data[indexI][indexJ])
                            .aspectRatio(1, contentMode: .fit)
                        
                    }
                }.padding(.horizontal, 10)
            }

            HStack(spacing: 10){
                GeometryReader { geometry in
                    
                    Capsule()
                        .foregroundColor(Color.orange)
                        .overlay{
                            Text("\(data[4][0])")
                                .font(.largeTitle)
                        }
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        .onAppear {
                            self.geometryCircleHeight = geometry.size.height
                        }
                    
                }
               
                CalculationButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                
                CalculationButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
                
            }.aspectRatio(CGSize(width:  geometryCircleHeight * 4 + 30, height: geometryCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
            
        }.padding(.bottom, 10)
    }
    
}

struct CalculationButton: View {
    
    var buttonName = ""
    
    var body: some View {
        Circle()
            .foregroundColor(Color.orange)
            .overlay (
                Text("\(buttonName)")
                    .font(.largeTitle)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
