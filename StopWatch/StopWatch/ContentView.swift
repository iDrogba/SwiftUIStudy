//
//  ContentView.swift
//  StopWatch
//
//  Created by 김상현 on 2022/02/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time: Double = 120.3
    
    var body: some View {
        
        ZStack{
            ClockTick()
            ClockNumber()
            CenterCircle()
            
            SecondHand(second: $time)
            MinuteHand(second: $time)
            
            SmallClockTick()
                .offset(y:50)
            SmallClockHand(second: $time)
                .offset(y:50)
            CenterCircle()
                .offset(y:50)
        }
        
    }
}

struct CenterCircle: View {
    var body: some View{
        Circle()
            .frame(width: 10, height: 10)
    }
}
struct ClockTick: View {
    let tickCount = 60
    
    var body: some View {
        ForEach(0..<tickCount){ tick in
            Rectangle()
                .fill(Color.black)
                .frame(width: 1, height: Int(tick)%5 == 0 ? 20 : 10)
                .offset(y: 100)
                .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
        }
    }
}

struct ClockNumber: View {
    var body: some View{
        ForEach(0..<12){ tick in
            Text("\(Int(tick) * 5)")
                .foregroundColor(Color.black)
                .rotationEffect(.degrees(Double(tick) * -30))
                .offset(y: -125)
                .rotationEffect(.degrees(Double(tick) * 30))
        }
    }
}

struct SmallClockTick: View {
    
    let tickCount = 10
    
    var body: some View {
        ForEach(0..<tickCount){ tick in
            Rectangle()
                .fill(Color.black)
                .frame(width: 1, height: 10)
                .offset(y: 30)
                .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
        }
    }
}

struct SecondHand: View {
    
    @Binding var second: Double
    
    let lengthOfHand: CGFloat = 80

    var body: some View {
        Rectangle()
            .frame(width: 3, height: lengthOfHand)
            .offset(y: -lengthOfHand/2)
            .rotationEffect(.degrees(second / 60 * 360))
    }
}

struct MinuteHand: View {
    
    @Binding var second: Double
    let lengthOfHand: Double = 60

    var body: some View {
        
        Rectangle()
            .frame(width: 3, height: lengthOfHand)
            .offset(y: -lengthOfHand/2)
            .rotationEffect(.degrees(second / 60 / 60 * 360))
    }
}


struct SmallClockHand: View {
    
    @Binding var second: Double
    
    let lengthOfHand: Double = 20

    var body: some View {
        Rectangle()
            .frame(width: 1, height: lengthOfHand)
            .offset(y: -lengthOfHand/2)
            .rotationEffect(.degrees(second / 60 * 60 * 360))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
