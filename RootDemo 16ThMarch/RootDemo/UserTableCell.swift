//
//  UserTableCell.swift
//  RootDemo
//
//  Created by Urvish Patel on 27/02/22.
//

import UIKit

class UserTableCell: UITableViewCell {

    private var objUser:User!{
        didSet{
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateCell(withUser user:User){
        self.objUser = user
    }
    private func updateUI(){
        //
        
    }
}
