//
//  Result Table View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Ammakolla, Viswakaranreddy. All rights reserved.
//

import UIKit

class Result_Table_View_Controller_Scene: UITableViewController {
    
    var arrayBook : NSMutableArray! = NSMutableArray()
    var dataBook : Data!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
   override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrayBook.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BookResultCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookResultCell
        
        // Configure the cell...
        let book1 = self.arrayBook.object(at: indexPath.row) as! BookObject
        
        if book1.imagelink == "N/A"{
            cell.ivBookCover.image = UIImage(named: "imagena.png")
        }else{
            let url = URL (string: book1.imagelink)
            cell.ivBookCover.sd_setImage(with: url)
        }
        
        cell.lbBookTitle.text = book1.title
        cell.lbBookAuthor.text = book1.author
        cell.lbBookPublisher.text = book1.publisher
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
