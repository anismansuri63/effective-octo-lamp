//
//  ChipCollectionViewCell.swift
//  RootDemo
//
//  Created by Urvish Patel on 16/03/22.
//

import UIKit

class ChipCollectionViewCell: UICollectionViewCell {
    static let identifer = "ChipCollectionViewCellIdentifier"
    
    @IBOutlet weak var lblName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(withName name:String){
        self.lblName.text = name 
    }

}
