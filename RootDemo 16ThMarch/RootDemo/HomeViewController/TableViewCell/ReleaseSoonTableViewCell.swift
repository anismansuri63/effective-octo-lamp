//
//  ReleaseSoonTableViewCell.swift
//  Pirates
//
//  Created by Jack SP on 20/11/21.
//

import UIKit

class ReleaseSoonTableViewCell: TSTableViewCell {
    
    @IBOutlet weak var lblTitle:PRLabel!
    @IBOutlet weak var lblSubTitle:PRLabel!
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var viewCollection:UIView!
    @IBOutlet weak var releaseSoonCollectionView:ReleaseSoonCollectionView!
    private var didSelectCellItem:HomeScreenBookTableViewCellSelectionHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.commonInit()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(){
        self.lblTitle.text = "Release Soon!"
        self.lblTitle.numberOfLines = 0
        self.lblTitle.textColor = UIColor.white
        self.lblTitle.font = UIFont.appFont_Bold(Size: 18)
        
        
        self.lblSubTitle.text = "Keep watching, wait for the latest manga"
        self.lblSubTitle.numberOfLines = 0
        self.lblSubTitle.textColor = UIColor.white
        self.lblSubTitle.font = UIFont.appFont_FontRegular(Size: 10.0)
        
        
        self.mainView.backgroundColor = UIColor.Theme.themeBlackColor
        
        self.viewCollection.backgroundColor = UIColor.clear
        
        self.releaseSoonCollectionView.loadBooks(withBooks: [PRBook(),PRBook(),PRBook()])
        self.releaseSoonCollectionView.setDidSelectPhotoHandler { [weak self] (aryBook, index) in
            
            if let value = self?.didSelectCellItem{
                value(HomeType.ReleaseSoon,aryBook[index])
            }
        }
    }
    func didSelectCellItem(withHandler handler:HomeScreenBookTableViewCellSelectionHandler?){
        if let value = handler{
            self.didSelectCellItem = value
        }
    }
}
