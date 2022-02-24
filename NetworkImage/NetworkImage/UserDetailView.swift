//
//  UserDetailView.swift
//  NetworkImage
//
//  Created by 김상현 on 2022/02/24.
//

import Foundation
import SwiftUI

struct UserDetailView: View{
    var user: User
    
    var body: some View{
        URLImage(urlString: user.avatar)
        Text(user.name)
            .font(.largeTitle)
        Text(user.createdAt)
    }
}
