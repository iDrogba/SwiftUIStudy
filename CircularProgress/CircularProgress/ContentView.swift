//
//  ContentView.swift
//  CircularProgress
//
//  Created by 김상현 on 2022/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0
    
    
    var body: some View {
        VStack{
            
            Slider(value: $progress)
                .padding()
            
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(progress == 1 ? Color.green : Color.red)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Text("\(String(format: "%.2f", progress * 100))"+"%")
                    .foregroundColor(progress == 1 ? Color.green : Color.red)
                    .font(.largeTitle)
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
