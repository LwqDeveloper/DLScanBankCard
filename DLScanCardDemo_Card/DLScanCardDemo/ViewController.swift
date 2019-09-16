//
//  ViewController.swift
//  DLScanCardDemo
//
//  Created by user on 2019/9/16.
//  Copyright © 2019 muyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let scanBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        scanBtn.backgroundColor = UIColor.blue
        scanBtn.addTarget(self, action: #selector(scanBtnTap), for: .touchUpInside)
        self.view.addSubview(scanBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CardIOUtilities.preload()
    }

    @objc private func scanBtnTap() {
        let scanController = CardIOPaymentViewController(paymentDelegate: self)
        self.present(scanController!, animated: true, completion: nil)
    }
}

extension ViewController: CardIOPaymentViewControllerDelegate {
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        let cardNum = cardInfo.redactedCardNumber
        let expiryMonth = cardInfo.expiryMonth
        let expiryYear = cardInfo.expiryYear
        let cvv = cardInfo.cvv
        
        print("卡号：" + cardNum!)
        print("到期时间：\(expiryYear)年 \(expiryMonth)月")
        print(cvv)
    }
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}

