//
//  FunctionModel.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/1/21.
//  Copyright © 2021 phjt. All rights reserved.
//

import Foundation
//功能
struct Function {
    let name :String
    init(name:String) {
        self.name = name
    }
}

//CustomStringConvertible:自定义字符串转换 协议
extension Function:CustomStringConvertible{
    var description: String{
        return "name:\(name)"
    }
}
