//
//  Item.swift
//  GridView
//
//  Created by 김상현 on 2022/02/01.
//

import Foundation

struct Item: Identifiable{
    
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [Item] {
        
        var tempArray = [Item]()
        
        for index in 0...30 {
            tempArray.append(
                Item(mainTitle: "Main Title Index\(index)", subTitle: "Sub Title Index\(index)", imageName: "IMG_\(index % 3)"))
        }
        
        return tempArray
    }
}
