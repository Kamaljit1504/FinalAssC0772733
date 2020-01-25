//
//  ProductTableViewController.swift
//  FinalAssC0772733
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController {
 
    
    var product: [Product]?
     var temp = singlteon.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        temp.createPro()
        //       print(temp.returnProductObj())
               product = temp.returnProductArray()
              saveCoreData()
               tableView.reloadData()
    }

    

        func saveCoreData(){
    //    clearCoreData()
             let appDelegate = UIApplication.shared.delegate as! AppDelegate

             let managedContext = appDelegate.persistentContainer.viewContext
             
             for  product in product!
             {
                 let proEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: managedContext)
                 proEntity.setValue(product.name, forKey: "name")
               // print(product.Product_Name)
                 proEntity.setValue(product.desc, forKey: "desc")
                  proEntity.setValue(product.id, forKey: "id")
                  proEntity.setValue(product.price, forKey: "price")
                 
                 // save context
                 do{
                     try managedContext.save()
                 }catch{
                     print(error)
                 }
             }
         }
         
        
        
        func loadCoreData(){
            product = [Product]()
           saveCoreData()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
           
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            
            do{
                let results = try managedContext.fetch(fetchRequest)
                if results is [NSManagedObject]{
                    for result in results as! [NSManagedObject]{
                        let name = result.value(forKey: "name") as! String
                        let desc = result.value(forKey: "desc") as! String
                        let id = result.value(forKey: "id") as! Int
                        let price = result.value(forKey: "price") as! Int
                        product?.append(Product(name: name, id: id, desc: desc, price: Float(price)))
                    }
                }
            }catch{
                print(error)
            }
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController
        {
            let PindexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))!
            let object = product![PindexPath.row]
            controller.setIndex(index: PindexPath.row ,data: object.id)
        }
    }
    
        
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  product?.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     let pro = product![indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Product")
            cell?.textLabel?.text = pro.name + "-" + pro.desc
            cell?.detailTextLabel?.text="\(pro.id) - \(pro.price)"
            return cell!
        // Configure the cell...

       // return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
