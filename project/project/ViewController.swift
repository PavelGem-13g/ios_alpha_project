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
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                if let error = error {
                    print("Ошибка при выполнении запроса: \(error)")
                }
                return
            }

            do {
                let memesData = try JSONDecoder().decode(MemesData.self, from: data)
                let memes = memesData.data.memes
                print(memes)
            } catch {
                print("Ошибка при декодировании JSON: \(error)")
            }
        }.resume()
    }
}

struct MemesData: Codable {
    let success: Bool
    let data: Memes
}

struct Memes: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int  // Используйте boxCount вместо "box_count"
    let captions: Int
}
