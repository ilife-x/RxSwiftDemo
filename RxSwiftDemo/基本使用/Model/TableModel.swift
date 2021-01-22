//
//  FunctionModel.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/1/22.
//  Copyright © 2021 phjt. All rights reserved.
//

import Foundation

class TableModel {
    let name : String
    init(name:String) {
        self.name = name
    }
}

extension TableModel:CustomStringConvertible{
    var description: String{
        return "name:\(name)"
    }
}
