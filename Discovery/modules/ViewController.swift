//
//  ViewController.swift
//  Discovery
//
//  Created by Ilham Hadi Prabawa on 3/15/19.
//  Copyright © 2019 Codenesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Connect Now", for: [])
        button.setTitleColor(.blue, for: [])
        button.addTarget(self, action: #selector(connect(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(connectButton)
        connectButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        connectButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func connect(_ sender: UIButton) {
        //PeopleService().getPeople()
        let service = EmployeeService()
        
        service.getEmployees(failure: { (message: String) in
            DispatchQueue.main.async {
                NDebug.shout("VC", "show error message UI: \(message)")
            }
        }) {
            DispatchQueue.main.async {
                NDebug.shout("VC", "handle main thread task")
            }
        }
    }
    
}

