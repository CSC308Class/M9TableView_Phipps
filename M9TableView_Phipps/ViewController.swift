//
//  ViewController.swift
//  M9TableView_Phipps
//
//  Created by Makendra Phipps on 4/2/26.
//cell
//section
//Delegate Pattern:
//one object allows another object to handle some of its task
//1) Datasource: get data
//2) Delegate: response to user actions


import UIKit

class ViewController: UIViewController {
    
    let fruits = ["Banana", "Apple", "Mango", "Melon", "Pineapple", "Orange"]
    
    let vegetable = ["Carrot", "Onion", "Tomato", "Cucumber", "Pepper", "Lettuce"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("#1.", #function)
        switch section{
        case 0:
            return fruits.count
        case 1:
            return vegetable.count
        default:
            return 0
        }
        
    }
    //This method is called repeatedly
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("#1.", #function, indexPath)
        //#1. Get or reuse a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //#2. put data into the cell
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = fruits[indexPath.row]
        case 1:
            cell.textLabel?.text = vegetable[indexPath.row]
        default:
            break
        }
        
        //#3. Return the cell
        return cell //for a cell
    }
}

