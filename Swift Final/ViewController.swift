//
//  ViewController.swift
//  CustomTableView
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

struct Bill
{
    var name: String
    var amount: Double
    var date: Date
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    var bills =
    [
            Bill(name: "Rent", amount: 789.98, date: Date(timeIntervalSinceNow: TimeInterval(0)))
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TheBillCell")
        
        cell?.textLabel?.text = bills[indexPath.row].name
        
        return cell!
    }
    
    
    @IBOutlet weak var startingAmount: UITextField!
    
    @IBOutlet weak var addNewBill: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var lblInfo: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("Leaving for teh SecondController. bills array has count of \(bills.count)")
        var det = segue.destination as? SecondViewController
        det?.billArray = bills
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "TheBillCell")
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("you clicked on row index \(indexPath.row)")
        lblInfo.text  = "Name: " + "\(bills[indexPath.row].name)" + " Amount: " + "\(bills[indexPath.row].amount)" + " Date Due: " + "\(bills[indexPath.row].date)"
        
    }
    
}


