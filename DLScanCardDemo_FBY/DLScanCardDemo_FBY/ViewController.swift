//
//  ViewController.swift
//  DLScanCardDemo_FBY
//
//  Created by user on 2019/9/17.
//  Copyright © 2019 muyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "银行卡识别"
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 50)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("银行卡识别", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        self.view.addSubview(button)
        
        resultLabel = UILabel(frame: CGRect(x: 10, y: 180, width: UIScreen.main.bounds.size.width - 20, height: 150))
        resultLabel.text = "扫描结果："
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.textColor = UIColor.white
        resultLabel.textAlignment = .left
        resultLabel.backgroundColor = UIColor.lightGray
        resultLabel.numberOfLines = 0
        self.view.addSubview(resultLabel)
    }
    
    @objc private func buttonTap() {
        let controller = FBYBankCardViewController()
        controller.scanCompletion = { [weak self] (success, model, error) in
            guard let `self` = self else { return }
            if success {
                var string = "扫描结果：" + "\n"
                string += "银行卡名称：" + model!.bankName + "\n"
                string += "银行卡号码：" + model!.bankNumber + "\n"
                self.resultLabel.text = string
            } else {
                self.resultLabel.text = error?.localizedDescription
            }
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

