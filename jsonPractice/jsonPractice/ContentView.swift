//
//  ContentView.swift
//  jsonPractice
//
//  Created by 김상현 on 2022/02/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {
        
        List(todos){ todo in
            VStack(alignment: .leading){
                Text(todo.title!)
                Text(todo.completed!.description)
            }
            
        }.onAppear {
            WebAPI().getTodos { todos in
                self.todos = todos
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
