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
        
        
        
        //创建一个以这个范围内所有值作为初始值的Observable序列。
        let ob6 = Observable<Int>.range(start: 1, count: 5)
        //等同于
        let ob7 = Observable.of(1,2,3,4,5)
        
        //该方法创建一个可以无限发出给定元素的 Event的 Observable 序列（永不终止）。
        let ob8 = Observable.repeatElement(1)
        
        //该方法创建一个只有当提供的所有的判断条件都为 true 的时候，才会给出动作的 Observable 序列。
        let ob9 = Observable.generate(initialState: 0) {
            $0 <= 10
        } iterate: {
            $0 + 2
        }
        //等同于
        let ob10 = Observable.of(0,2,4.6,8,10)
        
        //该方法接受一个 block 形式的参数，任务是对每一个过来的订阅进行处理
        let ob11 = Observable<String>.create { (observer) -> Disposable in
            observer.onNext("订阅处理")
            observer.onCompleted()
            
            return Disposables.create()
        }
        ob11.subscribe {
            print($0)
        }
        
        
        //该个方法相当于是创建一个 Observable 工厂，通过传入一个 block 来执行延迟 Observable序列创建的行为，而这个 block 里就是真正的实例化序列对象的地方。
        var odd = true
        
        let ob12:Observable<Int> = Observable.deferred {
            odd = !odd
            if odd == true {
                return Observable.of(1,3,5,7)
            }else{
                return Observable.of(2,4,6,8)
            }
        }
        
        ob12.subscribe { (event) in
            print(odd,event)
        }
        
        ob12.subscribe { (event) in
            print(odd,event)
        }
        
        //这个方法创建的 Observable 序列每隔一段设定的时间，会发出一个索引数的元素。而且它会一直发送下去
        let ob13 = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        ob13.subscribe { (event) in
//            print(event.element)
        }
        
        
        //这个方法有两种用法，一种是创建的 Observable序列在经过设定的一段时间后，产生唯一的一个元素。
        //第一个参数是延迟时长
        let ob14 = Observable<Int>.timer(2, scheduler: MainScheduler.instance)
        ob14.subscribe{event in
//            print(event)
        }
        //另一种是创建的 Observable 序列在经过设定的一段时间后，每隔一段时间产生一个元素。
        let ob15 = Observable<Int>.timer(2, period: 1, scheduler: MainScheduler.instance)
        ob15.subscribe{ event in
//            print(event)
        }
        print("-----------")
        let ob16 = Observable.of("A", "B", "C")
        ob16.do(onNext: { element in
        print("Intercepted Next：", element)
        }, onError: { error in
            print("Intercepted Error：", error)
        }, onCompleted: {
            print("Intercepted Completed")
        }, onDispose: {
            print("Intercepted Disposed")
        })
        .subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })

        
        
        
        
        
        

        
        
        
    
        
        
        
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


