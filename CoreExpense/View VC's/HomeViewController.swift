//
//  HomeViewController.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dailyExpView: UIView!
    
    @IBOutlet weak var monthlyExpView: UIView!
    
    @IBOutlet weak var yearlyExpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.dailyExpView.layer.cornerRadius = 12
        self.monthlyExpView.layer.cornerRadius = 12
        self.yearlyExpView.layer.cornerRadius = 12
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
    }
}
