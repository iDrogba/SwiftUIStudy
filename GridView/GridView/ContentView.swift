//
//  ContentView.swift
//  GridView
//
//  Created by 김상현 on 2022/02/01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gridType: GridType = GridType.single
    
    var body: some View {
       GridTypePicker(gridType: $gridType)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GridTypePicker:View {

    @Binding var gridType: GridType
    
    var body: some View {
        Picker("grid", selection: $gridType){
            ForEach(GridType.allCases, id: \.self){ type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "square.grid.2x2")
                case .triple:
                    Image(systemName: "square.grid.3x2")
                case .adaptive:
                    Image(systemName: "square.grid.4x3.fill")
                }
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}
