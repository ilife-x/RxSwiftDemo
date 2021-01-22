//
//  TableUseViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/1/21.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableUseViewController: UIViewController {
    
    fileprivate lazy var tableView:UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "RxTableView"
        
        view.addSubview(tableView)
        //rx 也需要注册cell
        tableView.register(TableCell.self, forCellReuseIdentifier: NSStringFromClass(TableCell.self))
        
        //将数据模型绑定到cell,闭包处理细节
        TableDataModel().dataModel.bind(to:tableView.rx.items(cellIdentifier: NSStringFromClass(TableCell.self))){(row, element, cell)in
            cell.textLabel?.text = "\(element) @ row \(row)"
            
        }.disposed(by: disposeBag)
        
        //点击事件
        tableView.rx.modelSelected(TableModel.self).subscribe { (model) in
            print("你选中的歌曲信息【\(model)】")

        }.disposed(by: disposeBag)
    }

}
