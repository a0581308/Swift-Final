//
//  SecondViewController.swift
//  Swift Final
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController
{
    var billArray : [Bill] = []
    var bill : Bill = Bill(name: "default", amount: 0.00, date: Date(timeIntervalSinceNow: TimeInterval(0)))
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet weak var billNameText: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(bill.name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Sending \(bill.name) back to tableView")
        var destination = segue.destination as? ViewController
        var name = ""
        var amount = 0.0
        let date = datePicker.date
        
        name = billNameText.text!
        amount = Double(billAmountText.text!)!
        //var newBill = Bill(name: name, amount: amount, date: date)
        print("Before: \(destination?.bills.count)")
        billArray.append(Bill(name: name, amount: amount, date: date))
        destination?.bills = billArray
        print("After: \(destination?.bills.count)")
    }}
