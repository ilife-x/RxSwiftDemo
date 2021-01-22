//
//  TableDataModel.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/1/22.
//  Copyright © 2021 phjt. All rights reserved.
//

import Foundation
import RxSwift
struct TableDataModel {
    let dataModel = Observable.just([
        TableModel(name: "第1行"),
        TableModel(name: "第2行"),
        TableModel(name: "第3行"),
        TableModel(name: "第4行"),
        TableModel(name: "第5行"),
        TableModel(name: "第6行"),
        TableModel(name: "第7行"),
        TableModel(name: "第8行"),
        TableModel(name: "第9行"),
        TableModel(name: "第10行"),
    ])
    
}
