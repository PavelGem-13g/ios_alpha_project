//
//  MemeTableManager.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

import UIKit

final class MemeTableManager: NSObject {
    var tableData: [Meme] = []
}

// MARK: - UITableViewDataSource

extension MemeTableManager: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = tableData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
//        configuration.image = UIImage()
        configuration.text = meme.name
        configuration.secondaryText = meme.url
        cell.contentConfiguration = configuration
        return cell
    }
}
