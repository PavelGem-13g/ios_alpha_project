//
//  MemeTableViewController.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

import UIKit
import Foundation

final class MemeTableViewController: UIViewController{
    private lazy var contentView: MemeTableView = {
       let view = MemeTableView()
        return view
    }()
    
    private let service : MemeServicing
    
    init(service: MemeServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchMeme{ memes in
            DispatchQueue.main.async{
                self.contentView.configure(with: memes)
            }
            
        }
    }
}
