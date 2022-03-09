//
//  NetWorkCenter.swift
//  CloneDanggeunMarket
//
//  Created by 김상현 on 2022/03/09.
//

import Foundation
import Alamofire

struct NetWorkCenter {
            
    func getHomeView_Post_Model(completion: @escaping ([HomeView_Post_Model]) -> Void){
        guard let url = URL(string: "https://62260bc92dfa524018fa721d.mockapi.io/post_danggeun") else { return }
        
        AF.request(url).responseJSON { response in
            print("response : "+"\(response)")

            do {
                let decoder = JSONDecoder()
                switch response.result {

                case .success(_):
                    let result = try decoder.decode([HomeView_Post_Model].self, from: response.data!)
                    
                    completion(result)

                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error : ", parsingError)
            }
        }.resume()
    }
    
    func getLocalView_Post_Model() {
            guard let url = URL(string: "https://62260bc92dfa524018fa721d.mockapi.io/post_localview") else { return }
            print("구현 중")
    }

}
