//
//  ViewController.swift
//  SingletonPro
//
//  Created by trung on 2018/08/21.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var outletTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Singleton.shared.index < Singleton.shared.array.count {
        outletTextField.text = String(Singleton.shared.array[Singleton.shared.index])
    }

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

        func actionButton(_ sender: Any) {
        if Singleton.shared.index > Singleton.shared.array.count {
            Singleton.shared.appen(number: Int(outletTextField.text ?? "") ?? 0)
        }
        else {
        Singleton.shared.editData(number: Int(outletTextField.text ?? "") ?? 0)
        }
        navigationController?.popViewController(animated: true)
    }
    
}

}
