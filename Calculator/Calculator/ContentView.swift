//
//  ContentView.swift
//  Calculator
//
//  Created by 김상현 on 2022/03/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var geometryCircleHeight : CGFloat = 50
    
    var body: some View {
        
        VStack(spacing:10){
        
            Spacer(minLength: 50)
            
            Text("????")
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width , alignment: .trailing)
            
            ForEach(0..<4){_ in
                HStack(spacing: 10){
                    ForEach(0..<4){ _ in
                        CalculationButton()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }.padding(.horizontal, 10)
            }
            

            HStack(spacing: 10){
                GeometryReader { geometry in
                    
                    Capsule()
                        .foregroundColor(Color.orange)
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        .onAppear {
                            self.geometryCircleHeight = geometry.size.height
                        }
                }
               
                CalculationButton()
                    .aspectRatio(1, contentMode: .fit)
                CalculationButton()
                    .aspectRatio(1, contentMode: .fit)
            }
            .aspectRatio(CGSize(width:  geometryCircleHeight * 4 + 30, height: geometryCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
        }.padding(.bottom, 10)
        
    }
}

struct CalculationButton: View {
    
    var body: some View {
        Circle()
            .foregroundColor(Color.orange)
            .overlay (
                Text("??")
                    .font(.largeTitle)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
