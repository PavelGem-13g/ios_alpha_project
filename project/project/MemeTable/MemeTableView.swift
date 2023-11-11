//
//  MemeTableView.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

import UIKit

final class MemeTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        return tableView
    }()

    private lazy var spinnerView =  UIActivityIndicatorView(style: .large)
    private lazy var tableManager = MemeTableManager()

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
        spinnerView.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: [Meme]) {
        tableManager.tableData = viewModel
        spinnerView.stopAnimating()
        tableView.reloadData()
    }
}


// MARK: - Private

private extension MemeTableView {
    func addSubviews() {
        [tableView, spinnerView].forEach {
            self.addSubview($0)
        }
    }
    func makeConstraints() {
        [tableView, spinnerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            spinnerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
}

