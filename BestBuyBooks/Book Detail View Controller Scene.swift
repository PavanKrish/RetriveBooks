//
//  Book Detail View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit

class Book_Detail_View_Controller_Scene: UIViewController {

    @IBOutlet weak var ivBookCover: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbPublisher: UILabel!
    
    @IBOutlet weak var lbDescription: UITextView!
    
    @IBOutlet weak var btnApple: UIButton!
    
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var lbGooglePrice: UILabel!
    @IBOutlet weak var lbApplePrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
