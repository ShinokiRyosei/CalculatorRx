## CalculatorRx
```swift
Observable.combineLatest(firstTextField.rx.text, secondTextField.rx.text) { (firstText, secoundText) -> Int in

    let firstNum: String = firstText ?? ""
    let secoundNum: String = secoundText ?? ""
    return (Int(firstNum) ?? 0) + (Int(secoundNum) ?? 0)
    }
    .map({ String($0) })
    .bind(to: answerLabel.rx.text)
    .disposed(by: disposeBag)
```
