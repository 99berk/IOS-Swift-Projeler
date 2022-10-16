//
//  ViewController.swift
//  HelloWorld
//
//  Created by Berk on 16.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteLbl.text = ""
    }

    @IBAction func pressButton(_ sender: Any) {
        noteLbl.text = "Hello World"
    }
}
