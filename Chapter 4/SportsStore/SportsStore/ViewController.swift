//
//  ViewController.swift
//  SportsStore
//
//  Created by Managam Silalahi on 12/24/16.
//  Copyright © 2016 Managam. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockField: UITextField!
    
    var product: Product?
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var totalStockLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var products: [Product] = {
        return [Product(name:"Kayak", description:"A boat for one person",
                        category:"Watersports", price:275.0, stockLevel:10),
                Product(name:"Lifejacket", description:"Protective and fashionable",
                        category:"Watersports", price:48.95, stockLevel:14),
                Product(name:"Soccer Ball", description:"FIFA-approved size and weight",
                        category:"Soccer", price:19.5, stockLevel:32),
                Product(name:"Corner Flags",
                        description:"Give your playing field a professional touch",
                        category:"Soccer", price:34.95, stockLevel:1),
                Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",
                        category:"Soccer", price:79500.0, stockLevel:4),
                Product(name:"Thinking Cap",
                        description:"Improve your brain efficiency by 75%",
                        category:"Chess", price:16.0, stockLevel:8),
                Product(name:"Unsteady Chair",
                        description:"Secretly give your opponent a disadvantage",
                        category: "Chess", price: 29.95, stockLevel:3),
                Product(name:"Human Chess Board",
                        description:"A fun game for the family", category:"Chess",
                        price:75.0, stockLevel:2),
                Product(name:"Bling-Bling King",
                        description:"Gold-plated, diamond-studded King",
                        category:"Chess", price:1200.0, stockLevel:4)]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayStockTotal()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayStockTotal() {
        let finalTotals = products.reduce((0, 0.0)) { (totals, products) -> (Int, Double) in
            return (
                totals.0 + products.stockLevel,
                totals.1 + products.stockValue
            )
        }
        
        totalStockLabel.text = "\(finalTotals.0) Products in Stock. Total Value: \(Utils.currencyString(fromNumber: finalTotals.1))"
    }
    
    @IBAction func stockLevelDidChange(_ sender: Any) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableViewCell {
                    if let product = cell.product {
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
                        } else if let textfield = sender as? UITextField {
                            if let newValue = Int(textfield.text!) {
                                product.stockLevel = newValue
                            }
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        
                        break
                    }
                }
                
                displayStockTotal()
            }
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.product = product
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = String(product.stockLevel)
        
        return cell
    }
}
