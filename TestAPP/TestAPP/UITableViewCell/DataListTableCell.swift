//
//  DataListTableCell.swift
//  TestAPP
//
//  Created by akash.jaiswal on 07/11/19.
//  Copyright © 2019 akash.jaiswal. All rights reserved.
//

import UIKit

class DataListTableCell: UITableViewCell {
    //IB Outlates
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblCreatedAt:UILabel!

}

//View Hirarchy
extension DataListTableCell{
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
    
    func setData(hits:Hits){
        self.lblTitle.text = "Title: \(hits.title ?? "")"
        self.lblCreatedAt.text = "Created: \(hits.created_at ?? "")"
    }
}
