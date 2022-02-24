//
//  ContentView.swift
//  NetworkImage
//
//  Created by 김상현 on 2022/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible())], content:{
                    ForEach(users){ user in
                        
                        NavigationLink(destination: Text("Destination"), label: HStack{
                            URLImage(urlString: user.avatar)
                            Text("\(user.name)")
                            Spacer()
                        })
                        
                    }
                })
            }.navigationBarTitle("User List")
        }.onAppear{
            WebService().loadUsers { users in
                self.users = users
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
