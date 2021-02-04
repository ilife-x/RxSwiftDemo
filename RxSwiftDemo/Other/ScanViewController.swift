//
//  ScanViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/4.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ScanViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         scan 就是先给一个初始化的数，然后不断的拿前一个结果和最新的值进行处理操作。
         */
        let observable = Observable.of(1,2,3,4,5,6,7)
        observable.scan(0) { (a, b)in
            return a + b
        }
        .subscribe{
            print($0)
        }
        .disposed(by: disposeBag)
        
        
        
    }
    


}

extension ScanViewController{
    func setupUI() {
        self.view.backgroundColor = .white
        self.title = "scan"
    }
}
