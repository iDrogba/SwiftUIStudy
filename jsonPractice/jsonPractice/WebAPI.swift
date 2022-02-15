//
//  WebAPI.swift
//  jsonPractice
//
//  Created by 김상현 on 2022/02/15.
//

import Foundation
import SwiftUI

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}

class WebAPI{
    
    func getTodos(completion: @escaping ([Todo])->Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }

            do{
                let todos = try JSONDecoder().decode([Todo].self, from: data)
                completion(todos)
            }catch{
                print(error)
            }
            
        }.resume()
    }
    
}
