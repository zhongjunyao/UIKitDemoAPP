//
//  Language.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit

enum Language {
    case en(desc: String = "English")
    case zhCN(desc: String = "简体中文")
    case zhHK(desc: String = "繁体中文")
    
    var desc: String {
        switch self {
        case .en(let desc):
            print("desc===>", desc)
            return desc
        case .zhCN(let desc):
            print("desc===>", desc)
            return desc
        case .zhHK(let desc):
            print("desc===>", desc)
            return desc
        }
    }
}

extension Language: CustomStringConvertible {
    var description: String {
        switch self {
        case .en(_):
            return "en"
        case .zhCN(_):
            return "zhCN"
        case .zhHK(_):
            return "zhHK"
        }
    }
}

extension Language: Equatable {
    // create a equatable function to only compare age property
    static func == (lhs: Language, rhs: Language) -> Bool {
        return lhs.description == rhs.description
    }
}
