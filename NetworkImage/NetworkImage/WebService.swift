//
//  WebService.swift
//  NetworkImage
//
//  Created by 김상현 on 2022/02/24.
//
import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var avatar: String
    var createdAt: String
}

//네트워크 연결만 할것이기 때문에 ObservableObject는 필요가없다.
class WebService {
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://62172a0571e7672e537556f8.mockapi.io/user") else{
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let getData = data else{ return }
            
            let users = try! JSONDecoder().decode([User].self, from: getData)
            
            completion(users)
        }.resume()
    }
    
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String
    
    init(urlString:String){
        self.urlString = urlString
        self.loadImageFromURL()
    }
    
    func loadImageFromURL(){
        guard let url = URL(string: urlString) else{ return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let getData = data else{ return }
            guard let loadImage = UIImage(data: getData) else{ return }
            
            //UI와 관련된 작업은 컴파일러에 의해 main thread 로 강제됨.
            DispatchQueue.main.async {
                self.image = loadImage
            }
        }.resume()
    }
}

struct URLImage: View {
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String){
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View{
        Image(uiImage: loader.image ?? UIImage(systemName: "return")!)
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fill)
    }
}
