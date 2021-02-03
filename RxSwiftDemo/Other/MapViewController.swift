//
//  MapViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/3.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MapViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        /**
         该操作符通过传入一个函数闭包把原来的 Observable 序列转变为一个新的 Observable 序列
         
         总结
         将一个可观察序列的每个元素投射到一个新形式中。
         */
        Observable.of(1,2,3)
            .map {
                 $0 * 10
            }
            .subscribe(onNext:{
                print($0)
            })
            .disposed(by: disposeBag)
            

    }
    

}

extension MapViewController{
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = "Map 使用"
    }
}
