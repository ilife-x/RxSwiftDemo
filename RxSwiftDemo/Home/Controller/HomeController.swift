//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2020/8/12.
//  Copyright © 2020 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeController: UIViewController {
    
    let tableView : UITableView = {
        var tableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 50
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "home"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //注册cell
        tableView.register(HomeCell.self, forCellReuseIdentifier: NSStringFromClass(HomeCell.self))
    }

}

//MARK:- DataSource
extension HomeController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FunctionViewModel().data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeCell.self), for: indexPath)
           if let cell = cell as? HomeCell {
               //自定义方法
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.textLabel?.text = FunctionViewModel().data[indexPath.row].name
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = .systemFont(ofSize: 15)
           }
           return cell
    }
    
    
}

//MARK:- Delegate
extension HomeController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let tableVc = TableUseViewController()
            self.navigationController?.pushViewController(tableVc, animated: true)
        default:
            return
        }
    }
}


