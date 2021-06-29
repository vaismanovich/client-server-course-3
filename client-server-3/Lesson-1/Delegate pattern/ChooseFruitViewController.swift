//
//  ChooseFruitViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 23/06/2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, FruitsViewContollerDelegate {
    
    

    @IBOutlet weak var fruitLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

  
    @IBAction func chooseFruitAction(_ sender: Any) {
        
        
//        let fruitsVC = FruitsViewController()
//        
//        
//        fruitsVC.delegate = self
//        self.navigationController?.pushViewController(fruitsVC, animated: true)
    }
    
    
    func fruitDidSelect(_ fruit: String) {
        self.fruitLabel.text = fruit
    }
}
