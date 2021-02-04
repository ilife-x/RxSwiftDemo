//
//  UntilChangedViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/4.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UntilChangedViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        /**
         distinctUntilChanged
         过滤掉连续的重复事件
         */
        Observable<Int>.of(1,2,2,3,4,5,5,5,6,7,8,8,8,9)
            .distinctUntilChanged()
            .subscribe(onNext:{
                print($0)
            })
            .disposed(by: disposeBag)
        
    }

}

extension UntilChangedViewController{
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = "UntilChangedViewController"
    }
}
