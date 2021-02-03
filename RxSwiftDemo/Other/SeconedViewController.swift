//
//  SeconedViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/2.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SeconedViewController: UIViewController {
    
   lazy var label : UILabel = {
    let label = UILabel()
    label.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
    label.backgroundColor = .yellow
    return label
    
    }()
    
    let disposbag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "binder"
        view.addSubview(label)
        
        
        //创建一个定时生成索引数的 Observable 序列，并将索引数不断显示在 label 标签上：
        
        //方式一
//        let observerbal = Observable<Int>.interval(DispatchTimeInterval.seconds(1), scheduler: MainScheduler.instance)
//        observerbal.map {"\($0)"}.bind{[weak self](text) in
//            self?.label.text = text
//        }.disposed(by: disposbag)
        
        //方式二
        let observer:Binder<String> = Binder(label) { (label, text) in
            label.text = text
        }
        
        let observable = Observable<Int>.interval(DispatchTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        observable.map {
            "当前索引数: \($0)"
        }
        .bind(to: observer)
        .disposed(by: disposbag)
        
        let fontObservable = Observable<Int>.interval(DispatchTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        fontObservable.map{
            CGFloat($0)
        }
        .bind(to: label.rx.fontSize)
        .disposed(by: disposbag)
 
    }
    


}

extension Reactive where Base:UILabel{
    public var fontSize:Binder<CGFloat>{
        return Binder(self.base) { (label, fontSize) in
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}
