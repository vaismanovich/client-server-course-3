//
//  NotificationCenterViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 21/06/2021.
//

import UIKit


let backgroundChangeColorNotification = Notification.Name("backgroundChangeColorNotification")


class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // подписаться на уведомдения self - backgroundChangeColorNotification
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: backgroundChangeColorNotification, object: nil)
        
    }
    
    @objc
    func changeColor(notification: Notification) {
       
        guard let color =  notification.userInfo?["color"] as? UIColor else{return}
        
        view.backgroundColor = color
    }
    
    
    @IBAction func ChangeColorAction(_ sender: Any) {
        
        let color =  UIColor.white
        //отправка  уведомления backgroundChangeColorNotification
        NotificationCenter.default.post(name: backgroundChangeColorNotification, object: nil, userInfo: ["color": color])
        print ("DONE")
    }
    
    
    //Отписаться от уведомлений self - backgroundChangeColorNotification
    deinit {
        NotificationCenter.default.removeObserver(self, name: backgroundChangeColorNotification, object: nil)
        print ("Dead")
    }
}
