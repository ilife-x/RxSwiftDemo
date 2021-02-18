//
//  SingleViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/18.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SingleViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         限制只发送一次事件，或者满足条件的第一个事件。
         如果存在有多个事件或者没有事件都会发出一个 error 事件。
         如果只有一个事件，则不会发出 error事件。
         */
        Observable.of(1,2,3,4)
            //在此可以指定条件
            .single{$0 == 2}
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        Observable.of("a","b","c","d")
            //也可以不指定条件,打印第一个元素
            .single()
            .subscribe(onNext:{
                print($0)
            })
            .disposed(by: disposeBag)
        
        /**
         elementAt 该方法实现只处理在指定位置的事件。
         */
        
        Observable.of("A","B","C","D")
            //也可以不指定条件,打印第一个元素
            .elementAt(2)
            .subscribe(onNext:{
                print($0)
            })
            .disposed(by: disposeBag)
        
        /**
         该操作符可以忽略掉所有的元素，只发出 error或completed 事件。
         如果我们并不关心 Observable 的任何元素，只想知道 Observable 在什么时候终止，那就可以使用 ignoreElements 操作符
         */
        Observable.of("A","B","C","D")
            //也可以不指定条件,打印第一个元素
            .ignoreElements()
            .subscribe{
                print($0)
            }
            .disposed(by: disposeBag)
    }
    

}

//MARK:- UI
extension SingleViewController{
    func setupUI() {
        self.view.backgroundColor = .white
        self.title = "single & elementAt & ignoreElements"
    }
}
