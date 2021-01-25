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
        
        //我们可以通过如下几种方法来创建一个 Observable序列
        
        //该方法通过传入一个默认值来初始化
        let ob0 = Observable<Int>.just(5)
        
        //该方法可以接受可变数量的参数（必需要是同类型的）
        let ob1 = Observable.of("a","b","c")
        
        //该方法需要一个数组参数。
        let array = [1,2,3,4,5]
        let ob2 = Observable.from(array)
        
        //该方法创建一个空内容的 Observable 序列。:必须要指明类型,因为没有元素,无法做类型推断
        let ob3 = Observable<Any>.empty()
        
        //该方法创建一个永远不会发出 Event（也不会终止）的 Observable 序列。
        let ob4 = Observable<Any>.never()
        
        
        //该方法创建一个不做任何操作，而是直接发送一个错误的 Observable 序列
        enum MyError :Error{
            case A
            case B
        }
        let ob5 = Observable<Any>.error(MyError.A)
        
        
        
     
        print(ob0)
        print(ob1)
        print(ob2)
        print(ob3)
        print(ob4)
        print(ob5)
        
        
        
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


