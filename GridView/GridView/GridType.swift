//
//  GridType.swift
//  GridView
//
//  Created by 김상현 on 2022/02/01.
//

import Foundation
import SwiftUI

//caseIterable은 배열을 제공할 수 있게해줌.
enum GridType: CaseIterable{
    case single
    case double
    case triple
    case adaptive
    
    var columns: [GridItem]{
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()), GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 80))]
        }
    }
}
