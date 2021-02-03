//
//  BufferViewController.swift
//  RxSwiftDemo
//
//  Created by xiao on 2021/2/3.
//  Copyright © 2021 phjt. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BufferViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        /**
         
         timeSpan
         Maximum time length of a buffer.
         count
         Maximum element count of a buffer.
         scheduler
         Scheduler to run buffering timers on.

         buffer :缓冲
         第一个参数是缓冲时间,到了这个时间就会发出一次事件
         第二个参数是缓冲数量,到了这个数量也会发出一次事件,如果数量没到,时间到了,也会发出
         第三个参数是线程,这里指的是主线程
         
         注意:发出的是元素集合,也就是数组
         */
        let subject = PublishSubject<String>()
        subject
            .buffer(timeSpan: RxTimeInterval.seconds(1), count: 3, scheduler: MainScheduler.instance)
            .subscribe(onNext:{print($0)})
            .disposed(by: disposeBag)
        
        subject.onNext("0")
        subject.onNext("1")
        subject.onNext("2")

        subject.onNext("a")
        subject.onNext("b")


        

    }

}

//MARK:- UI
extension BufferViewController{
    
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = "buffer 使用"
    }
}
