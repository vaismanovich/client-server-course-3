//
//  NetworkViewController.swift
//  client-server-3
//
//  Created by Vitaliy on 26/06/2021.
//

import UIKit
import Alamofire



class NetworkViewController: UIViewController {
    
    let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getWeatherData(city: "Tbilisi") { value in
            print(value as Any)
        }
        
       // firstRequest()
       // secondRequest()
        //thirdRequest()
    }
    
    func thirdRequest() {
        
        let parameters: Parameters = [
                   "q": "München,DE",
                   "appid": "b1b15e88fa797225412429c1c50c122a1"
               ]

        
        AF.request("http://samples.openweathermap.org/data/2.5/forecast", parameters: parameters).responseJSON { response in
            print(response.value as Any)
            
        }
    }
    
    
    // Запрос со сложным  кодированием. не аннлийским URL. Post запрос
    func secondRequest() {
      
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        
        //URL components делает правильную кодировку
        var urlConstructor = URLComponents()
        // устанавливаем схему
                urlConstructor.scheme = "http"
        // устанавливаем хост
                urlConstructor.host = "samples.openweathermap.org"
        // путь
                urlConstructor.path = "/data/2.5/forecast"
        // параметры для запроса
                urlConstructor.queryItems = [
                    URLQueryItem(name: "q", value: "München,DE"),
                    URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
                ]
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "POST"
        
        
        let task = session.dataTask(with: request) { data, response, error in
         
        guard let data = data else {return}
         
        
         do {
             let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
             print(json)

         } catch {
             print(error)
         }
         
                     
         
     }
     task.resume()
    }
    
    //Простой Get запрос
    func firstRequest() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else {return}
        
        
           let task = session.dataTask(with: url) { data, response, error in
            
           guard let data = data else {return}
            
           
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)

            } catch {
                print(error)
            }
            
                        
            
        }
        task.resume()
    }
}
  
