//
//  ContentView.swift
//  Calculator
//
//  Created by 김상현 on 2022/03/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var geometryCircleHeight : CGFloat = 50
    @State private var display : String = "0"
    @State private var isTyping = false
    var core = CalculationCore()
    
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
            
            Text("\(display)")
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width ,alignment: .trailing)
            
            ForEach(0..<4){ indexI in
                HStack(spacing: 10){
                    ForEach(0..<4){ indexJ in
                        
                        Button (action: {
                            calculationAction(symbol: data[indexI][indexJ])
                        }, label: {
                            CalculationButton(buttonName: data[indexI][indexJ])
                            .aspectRatio(1, contentMode: .fit)
                        })
                       
                    }
                }.padding(.horizontal, 10)
            }

            HStack(spacing: 10){
                GeometryReader { geometry in
                    
                    Capsule()
                        .foregroundColor(Color.orange)
                        .overlay{Text("\(data[4][0])")
                                .font(.largeTitle)}
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        .onAppear { self.geometryCircleHeight = geometry.size.height }
                        .onTapGesture(count: 1) {
                            calculationAction(symbol: data[4][0])
                        }
                    
                }
               
                CalculationButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(perform: {
                        calculationAction(symbol: data[4][1])
                    })
                
                CalculationButton(buttonName: data[4][2])
                    .onTapGesture(count: 1, perform: {
                        calculationAction(symbol: data[4][2])
                    })
                    .aspectRatio(1, contentMode: .fit)
                
            }.aspectRatio(CGSize(width: geometryCircleHeight * 4 + 30, height: geometryCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
            
        }.padding(.bottom, 10)
    }
    
    func calculationAction(symbol: String) {
        print(symbol)
        if  Int(symbol) != nil {
            
            if isTyping {
                display += symbol
                
            }else{
                display = symbol
                isTyping = true
            }

        }else{
            isTyping = false
            
            if core.digit1 == nil {
                core.digit1 = Double(display)
                
            }else {
                core.digit2 = Double(display)
            }
            
            if symbol != "=" {
                core.symbol = symbol
            }
            
            if symbol == "AC" {
                core.digit1 = nil
                core.digit2 = nil
                core.calculateResult = nil
                core.symbol = nil
                display = "0"
            }
            
            if symbol == "%" {
                display = "\(String(describing: core.logic()!))"
                core.digit1 = Double(display)
            }
            
            if symbol == "=" {
                display = String(describing: core.logic()!)
                //calculationCore.symbol = nil
            }
        }
        
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
