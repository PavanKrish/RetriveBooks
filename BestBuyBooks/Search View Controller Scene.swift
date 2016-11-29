//
//  Search View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit

class Search_View_Controller_Scene: UIViewController {

    @IBOutlet weak var tfQuery: UITextField!
    var arrayBooks : NSMutableArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var onSubmit: UIButton!
    
    @IBAction func onSubmit(_ sender: AnyObject) {
        
        self.arrayBooks = NSMutableArray()
        if self.tfQuery.text?.characters.count == 0{
            let alert = UIAlertController(title: "Alert", message: "query is empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return;
    }
        if (self.tfQuery.text?.characters.count)! > 30{
            let alert = UIAlertController(title: "Alert", message: "Query should be short than 30 characters", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
