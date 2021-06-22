//
//  ViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 20/06/2021.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var amountTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func sendCashAction(_ sender: Any) {
        
        guard let cashString = amountTextField.text, let cash = Int(cashString) else {return}
        
        Account.shared.name = nameTextField.text ?? ""
        Account.shared.cash = cash
    }
    
    

}

