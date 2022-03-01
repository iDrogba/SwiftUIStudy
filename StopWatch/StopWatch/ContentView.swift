//
//  ContentView.swift
//  StopWatch
//
//  Created by 김상현 on 2022/02/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time: Double = 0
    @State private var timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    @State private var isContinue = false
    var readFormatString: String {
        let readFormatMinute = String(format: "%02d", Int(time) / 60)
        let readFormatSecond = String(format: "%02d", Int(time) % 60)
        let readFormatMinSecond = String(format: "%.2f", remainder(time, 60)).split(separator: ".").last ?? "0"
        
        return readFormatMinute + ":" + readFormatSecond + ":" + readFormatMinSecond
    }
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                ClockNumber()
                
                ClockTick()
                SmallClockTick()
                    .offset(y:50)
                
                SecondHand(second: $time)
                MinuteHand(second: $time)
                MinSecondHand(second: $time)
                    .offset(y:50)
                
                CenterCircle()
                CenterCircle()
                    .offset(y:50)
            }
            .onReceive(timer,perform: { _ in
                if isContinue {
                    withAnimation{
                        time += 0.01
                    }
                }
            })
            .padding(.bottom, 100)
            Spacer()
            ReadFormatTime(readFormatTime: readFormatString)
            
            StartStopButton(isStart: $isContinue)
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

struct SmallClockTick: View {
    
    let tickCount = 10
    
    var body: some View {
        ForEach(0..<tickCount){ tick in
            Rectangle()
                .fill(Color.green)
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
            .fill(Color.blue)
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
            .fill(Color.red)
            .frame(width: 3, height: lengthOfHand)
            .offset(y: -lengthOfHand/2)
            .rotationEffect(.degrees(second / 60 / 60 * 360))
    }
}


struct MinSecondHand: View {
    
    @Binding var second: Double
    
    let lengthOfHand: Double = 20

    var body: some View {
        Rectangle()
            .frame(width: 1, height: lengthOfHand)
            .offset(y: -lengthOfHand/2)
            .rotationEffect(.degrees(second / 60 * 60 * 360))
    }
}

struct CenterCircle: View {
    var body: some View{
        Circle()
            .frame(width: 10, height: 10)
    }
}

struct ReadFormatTime: View{
    var readFormatTime = ""
    
    var body:some View{
        Text("\(readFormatTime)")
            .frame(width: UIScreen.main.bounds.width)
            .font(.largeTitle)
    }
}

struct StartStopButton: View {
    
    @Binding var isStart: Bool
    
    var body: some View{
        ZStack{
            HStack(spacing: 0){
                Button(action:{
                    isStart = true
                }, label: {
                    Text("Start")
                        .font(.title)
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.main.bounds.size.width/2,height: UIScreen.main.bounds.size.height/10)
                })
                .background(Color.orange)

                Button(action:{
                    isStart = false
                }, label: {
                    Text("Stop")
                        .frame(width: UIScreen.main.bounds.size.width/2,height: UIScreen.main.bounds.size.height/10)
                        .background(Color.orange.opacity(0.7))
                        .font(.title)
                })
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
