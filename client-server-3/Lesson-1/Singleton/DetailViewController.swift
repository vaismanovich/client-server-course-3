//
//  DetailViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 20/06/2021.
//

import UIKit

class DetailViewController: UIViewController {

 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = Account.shared.name
        amountLabel.text = "\(Account.shared.cash)"
     
    }
    



}
