//
//  FruitsViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 23/06/2021.
//

import UIKit


protocol FruitsViewContollerDelegate: AnyObject {
    
    func fruitDidSelect(_ fruit: String)
}


class FruitsViewController: UITableViewController {
    
    weak var delegate: FruitsViewContollerDelegate?
  
   
      
    
    
    
    let fruits = ["Apple", "Avocado", "Banana", "Kiwi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    
    
  override  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let fruit = fruits[indexPath.row]
        
        delegate?.fruitDidSelect(fruit)
        self.navigationController?.popViewController(animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }

}
