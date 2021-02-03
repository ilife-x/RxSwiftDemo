//
//  WindowViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/3.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class WindowViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         将可观察序列的每个元素投射到一个窗口中，当该窗口已满或已经过给定的时间时，该窗口就完成了。
         window 操作符和 buffer 十分相似。不过 buffer 是周期性的将缓存的元素集合发送出来，而 window 周期性的将元素集合以 Observable 的形态发送出来。
         同时 bbuffer要等到元素搜集完毕后，才会发出元素序列。而 window 可以实时发出元素序列。
         注意:发出的元素是Observable的,直接可以订阅
         */
        let subject = PublishSubject<String>()
        subject
            .window(timeSpan: RxTimeInterval.seconds(1), count: 3, scheduler: MainScheduler.instance)
            .subscribe(onNext:{[weak self] in
                $0.asObservable()
                    .subscribe(onNext:{print($0)})
                    .disposed(by: self!.disposeBag)
            })
            .disposed(by: disposeBag)

        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
         
        subject.onNext("1")
        subject.onNext("2")
    }


}

//MARK:- UI
extension WindowViewController{
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = "windwo 使用"

    }
}
