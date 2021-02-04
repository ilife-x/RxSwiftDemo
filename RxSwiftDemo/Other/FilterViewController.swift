//
//  FilterViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/4.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilterViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         filter 过滤不符合条件的事件
         */
        Observable<Int>.of(1,4,13,22,78,48,98,45,23)
            .filter { (item) -> Bool in
                return item > 20
            }
            .subscribe (onNext:{ e in
                print(e)
            })
            .disposed(by: disposeBag)
    }

}

extension FilterViewController{
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = "filter"
    }
}
