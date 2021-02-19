//
//  DebounceViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/19.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DebounceViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         debounce
            防抖动，防止误操作
         
         */
        
        let times = [
                    [ "value": 1, "time": 0.1 ],
                    [ "value": 2, "time": 1.1 ],
                    [ "value": 3, "time": 1.2 ],
                    [ "value": 4, "time": 1.2 ],
                    [ "value": 5, "time": 1.4 ],
                    [ "value": 6, "time": 2.1 ]
                ]
        //生成对应的 Observable 序列并订阅
//        Observable.from(times)
//            .flatMap { item in
//                return Observable.of(Int(item["value"]!))
//                    .delaySubscription(Double(item["time"]),
//                                       scheduler: MainScheduler.instance)
//            }
//            .debounce(RxTimeInterval.seconds(Int(0.5)), scheduler: MainScheduler.instance) //只发出与下一个间隔超过0.5秒的元素
//            .subscribe({ print($0) })
//            .disposed(by: disposeBag)
        
        
    }
    


}

//MARK:- UI
extension DebounceViewController{
    func setupUI() {
        self.view.backgroundColor = .white
        self.title = "debounce"
    }
}
