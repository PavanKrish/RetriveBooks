//
//  Result Table View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit

class Result_Table_View_Controller_Scene: UIViewController {
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrayBook.count
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
