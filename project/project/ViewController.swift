//
//  ViewController.swift
//  project
//
//  Created by Павел on 08.10.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        
        let url:URL = URL(string: "https://api.imgflip.com/get_memes")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                let response,
                error == nil
            else{
                return
            }
            let str = String(data:data, encoding: .utf8)
            print ("Полученные данные: \(str ?? "")")
        }).resume()
    }


}

