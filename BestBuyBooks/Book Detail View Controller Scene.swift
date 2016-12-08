//
//  Book Detail View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit


class Book_Detail_View_Controller_Scene: UIViewController {
    var book : BookObject!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbAuthor: UILabel!
    
    @IBOutlet weak var lbPublisher: UILabel!
    
    
    @IBOutlet weak var lbDescription: UITextView!
    
    @IBOutlet weak var ivBookCover: UIImageView!
    
    @IBOutlet weak var btnApple: UIButton!


    @IBOutlet weak var btnGoogle: UIButton!
    
   
    @IBOutlet weak var lbApplePrice: UILabel!
   
    
    @IBOutlet weak var lbGooglePrice: UILabel!
  
    
  
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbTitle.text = self.book.title
        self.lbAuthor.text = self.book.author
        self.lbPublisher.text = self.book.publisher
        self.lbDescription.text = self.book.descriptString
        if self.book.imagelink == "N/A"{
            self.ivBookCover.image = UIImage(named: "imagena.png")
        }else{
            let url = URL (string: self.book.imagelink)
            self.ivBookCover.sd_setImage(with: url)
        }
        
        self.lbApplePrice.text = self.book.apple_price
        self.lbGooglePrice.text = self.book.google_price
        
    }


    @IBAction func onAppleLink(_ sender: AnyObject) {
        if self.book.apple_link == "N/A"{
            return;
        }
        
        let url = URL(string: self.book.apple_link)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
        // Do any additional setup after loading the view.
 
    @IBAction func onGoogleLink(_ sender: AnyObject) {
        if self.book.google_link == "N/A"{
            return;
        }
        
        let url = URL(string: self.book.google_link)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
