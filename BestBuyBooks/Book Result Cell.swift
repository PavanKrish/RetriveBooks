//
//  Book Result Cell.swift
//  BestBuyBooks
//
//  Created by User on 12/5/16.
//  Copyright © 2016 Gelli,Chiklith Madhukar Siva Sai. All rights reserved.
//

import UIKit
import Foundation

class BookResultCell: UITableViewCell {


    @IBOutlet weak var ivBookCover: UIImageView!

    @IBOutlet weak var lbBookTitle: UILabel!
    
    @IBOutlet weak var lbBookAuthor: UILabel!
    
    @IBOutlet weak var lbBookPublisher: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
