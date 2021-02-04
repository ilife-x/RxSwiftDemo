//
//  GroupByViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/4.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GroupByViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        /**
         groupby 操作符将 源Observerbal 拆分成多个子 observerbal,然后,将这些子observable 单独发送出来
         会通过 keySelector 这个键进行分组,然后将分组的元素,以observable的形式发送出来,所以元素是可以订阅的
         */
        Observable<Int>.of(1,2,3,4,5,6,7)
            .groupBy(keySelector: { (item)->String in
                //键: "偶数":"奇数"
                item % 2 == 0 ? "偶数":"奇数"

            })
            .subscribe { (event) in
                switch event{
                case .next(let sonGroup):
                    sonGroup.asObservable().subscribe { (event) in
                        print(sonGroup.key,event)
                    }.disposed(by: self.disposeBag)
                case .completed:
                    do {
                        print("分组完成")
                    }
                default:
                print("")
                }

                
            }.disposed(by: disposeBag)
        
            
            
            

    }

}

extension GroupByViewController{
    func setupUI()  {
        self.view.backgroundColor = .white
        self.title = "group by"
    }
}
