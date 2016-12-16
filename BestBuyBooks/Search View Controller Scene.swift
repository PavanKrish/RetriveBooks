//
//  Search View Controller Scene.swift
//  BestBuyBooks
//
//  Created by User on 11/23/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit
import MBProgressHUD

class Search_View_Controller_Scene: UIViewController {

    @IBOutlet weak var tfQuery: UITextField!
    var arrayBooks : NSMutableArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpeg")!)

        // Do any additional setup after loading the view.
    }

 
    
    @IBAction func onSubmit(_ sender: AnyObject) {
        
        self.arrayBooks = NSMutableArray()
        if self.tfQuery.text?.characters.count == 0{
            let alert = UIAlertController(title: "Alert", message: "Search Query is empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return;
    }
        if (self.tfQuery.text?.characters.count)! > 30{
            let alert = UIAlertController(title: "Alert", message: "Search Query too long, limit it to 30 characters.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return;
        }
        
        self.tfQuery.resignFirstResponder()
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            var searchString:String = self.tfQuery.text!
            searchString = searchString.replacingOccurrences(of: " ", with: "+")
            let urlString = String(format:"https://www.googleapis.com/books/v1/volumes?q=%@&key=AIzaSyCg-cr3wsxUWjgZNSEzAsQHVqB3eZ97QFQ", searchString )
            print(urlString);
            let url = URL (string: urlString)
            
            let data = try! Data(contentsOf: url!)
            //let json = try! JSONSerialization.jsonObject(with: data) as [String:Any]
            let parsedData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            //print(json)
            
            let arrayItems = parsedData?["items"] as? NSArray
            
            for item1 in arrayItems!{
                print("===========new item========================")
                
                let dicItem = item1 as! NSDictionary
                let selfurlString = dicItem["selfLink"] as! String
                let selfurl = URL (string: selfurlString)
                let data1 = try! Data(contentsOf: selfurl!)
                let parsedData1 = try! JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary
                
                //print(parsedData1)
                let bookObj1 = BookObject()
                
                // volum info extract
                
                let volumInfoDict = parsedData1?["volumeInfo"] as! NSDictionary
                //print("volumInfoDict ----------\(volumInfoDict)")
                
                let saleInfoDict = parsedData1?["saleInfo"] as! NSDictionary
                //print("saleInfoDiec -------- \(saleInfoDict)")
                
                if let arrayAuthos : NSArray = volumInfoDict.object(forKey: "authors") as? NSArray{
                    let authString = arrayAuthos.componentsJoined(by: ", ")
                    bookObj1.author = authString
                }else{
                    bookObj1.author = "N/A"
                }
                print("auth String-----------\(bookObj1.author)")
                
                if let titleString : String = volumInfoDict.object(forKey: "title") as? String{
                    bookObj1.title = titleString
                }else{
                    bookObj1.title = "N/A"
                }
                print("title String-----------\(bookObj1.title)")
                
                if let publisherString : String = volumInfoDict.object(forKey: "publisher") as? String{
                    bookObj1.publisher = publisherString
                }else{
                    bookObj1.publisher = "N/A"
                }
                print("publisher-----------\(bookObj1.publisher)")
                
                if let descString : String = volumInfoDict.object(forKey: "description") as? String{
                    bookObj1.descriptString = descString
                }else{
                    bookObj1.descriptString = "N/A"
                }
                print("description-----------\(bookObj1.descriptString)")
                
                if let arryIdentifiers : NSArray = volumInfoDict.object(forKey: "industryIdentifiers") as? NSArray{
                    
                    if let isbn1 : NSDictionary = arryIdentifiers.object(at: 1) as? NSDictionary {
                        if let isbnString : String = isbn1.object(forKey: "identifier") as? String{
                            bookObj1.isbn13 = isbnString
                        }else{
                            bookObj1.isbn13 = "N/A"
                        }
                    }else{
                        bookObj1.isbn13 = "N/A"
                    }
                }else{
                    bookObj1.isbn13 = "N/A"
                }
                print("isbn-----------\(bookObj1.isbn13)")
                
                // google price extract
                
                if let priceDict : NSDictionary = saleInfoDict.object(forKey: "listPrice") as? NSDictionary{
                    
                    if let googlePrc : NSNumber = priceDict.object(forKey: "amount") as? NSNumber{
                        bookObj1.google_price = googlePrc.stringValue
                    }else{
                        bookObj1.google_price = "N/A"
                    }
                }else{
                    bookObj1.google_price = "N/A"
                }
                print("google_price-----------\(bookObj1.google_price)")
                
                if let retailpriceDict : NSDictionary = saleInfoDict.object(forKey: "retailPrice") as? NSDictionary{
                    if let googlePrc : String = retailpriceDict.object(forKey: "amount") as? String{
                        bookObj1.google_retail_price = googlePrc
                    }else{
                        bookObj1.google_retail_price = "N/A"
                    }
                }else{
                    bookObj1.google_retail_price = "N/A"
                }
                print("google_retail_price-----------\(bookObj1.google_retail_price)")
                
                if let googlebuy : String = saleInfoDict.object(forKey: "buyLink") as? String{
                    bookObj1.google_link = googlebuy
                }else{
                    bookObj1.google_link = "N/A"
                }
                print("google_link-----------\(bookObj1.google_link)")
                
                // image extract
                if let thumbDict : NSDictionary = volumInfoDict.object(forKey: "imageLinks") as? NSDictionary{
                    if let thumbLink : String = thumbDict.object(forKey: "smallThumbnail") as? String{
                        bookObj1.imagelink = thumbLink
                        
                    }else{
                        bookObj1.imagelink = "N/A"
                    }
                }else{
                    bookObj1.imagelink = "N/A"
                }
                print("imageLink-----------\(bookObj1.imagelink)")
                
                // apple price extract
                if bookObj1.isbn13 == "N/A"{
                    bookObj1.apple_link = "N/A"
                    bookObj1.apple_price = "N/A"
                    
                }else{
                    let appleUrlString = String(format:"https://itunes.apple.com/lookup?isbn=%@", bookObj1.isbn13 )
                    
                    let appleurl = URL (string: appleUrlString)
                    let appledata = try! Data(contentsOf: appleurl!)
                    let appleDict = try! JSONSerialization.jsonObject(with: appledata, options: .allowFragments) as? NSDictionary
                    
                    //print("appleDict ------------------\(appleDict)")
                    
                    if let resultArray : NSArray = appleDict?.object(forKey: "results") as? NSArray{
                        
                        if resultArray.count > 0{
                            let resultDict = resultArray.object(at: 0) as? NSDictionary
                            if let trackurl : String = resultDict?.object(forKey: "trackViewUrl") as? String {
                                bookObj1.apple_link = trackurl
                            }else{
                                bookObj1.apple_link = "N/A"
                            }
                            
                            if let formatPrice : String = resultDict?.object(forKey: "formattedPrice") as? String{
                                bookObj1.apple_price = formatPrice
                            }else{
                                bookObj1.apple_price = "N/A"
                            }
                            
                        }else{
                            bookObj1.apple_link = "N/A"
                            bookObj1.apple_price = "N/A"
                        }
                        
                    }else{
                        bookObj1.apple_link = "N/A"
                        bookObj1.apple_price = "N/A"
                    }
                }
                print("appleLink------------------\(bookObj1.apple_link)");
                print("applePrice------------------\(bookObj1.apple_price)");
                
                print("Item complete=========================")
                // add to booklist
                
                self.arrayBooks.add(bookObj1)
            }
            
            print("next page")
            
            DispatchQueue.main.async{
                MBProgressHUD.hide(for: self.view, animated: true)
                print("main")
                
                let tcanpcVC = self.storyboard?.instantiateViewController(withIdentifier: "Result_Table_View_Controller_Scene") as! Result_Table_View_Controller_Scene
                tcanpcVC.arrayBook = self.arrayBooks
                self.navigationController?.pushViewController(tcanpcVC, animated: true)
            }
            
            DispatchQueue.main.async {
                
            }
        }

    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
