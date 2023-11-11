//
//  MemeTableViewControllerFabric.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

final class MemeTableViewControllerFactory{
    func build() -> MemeTableViewController {
        let service = MemeService()
        let viewController = MemeTableViewController(service: service)
        return viewController
    }
}
