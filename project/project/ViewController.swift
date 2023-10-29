//
//  ViewController.swift
//  project
//
//  Created by Павел on 08.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = memesData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = meme.name
        configuration.secondaryText = String(meme.captions)
        cell.contentConfiguration = configuration
        return cell
    }
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        return tableView
    }()
    
    private var memesData: [Meme] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let url:URL = URL(string: "https://api.imgflip.com/get_memes")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            var memesData = try! decoder.decode(MemesData.self, from: data)
            self.memesData = memesData.data.memes
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        }).resume()
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
    let boxCount: Int  // Используйте boxCount вместо "box_count"
    let captions: Int
}
