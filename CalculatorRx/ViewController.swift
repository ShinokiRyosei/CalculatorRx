//
//  ViewController.swift
//  CalculatorRx
//
//  Created by ShinokiRyosei on 2017/09/20.
//  Copyright © 2017年 ShinokiRyosei. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!

    @IBOutlet weak var answerLabel: UILabel!

    let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()


        Observable.combineLatest(firstTextField.rx.text, secondTextField.rx.text) { (firstText, secoundText) -> Int in

            let firstNum: String = firstText ?? ""
            let secoundNum: String = secoundText ?? ""
            return (Int(firstNum) ?? 0) + (Int(secoundNum) ?? 0)
            }
            .map({ String($0) })
            .bind(to: answerLabel.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

