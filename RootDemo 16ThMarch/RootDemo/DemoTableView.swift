//
//  DemoTableView.swift
//  RootDemo
//
//  Created by Urvish Patel on 27/02/22.
//

import UIKit
class User:NSObject{
    var strName:String = ""
    var strNo:String = ""
    
    override init(){
        super.init()
        
    }
    
}
class DemoTableView: UITableView {
    
    
    private var aryUserList:[User] = []
    private var didSelectTableCellHandler:((_ user:User,_ isSuccess:Bool)->Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }
    override func awakeFromNib() {
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func commonInit() {
       
        let objUser = User()
        
        self.estimatedRowHeight = 60.0
        self.rowHeight = UITableView.automaticDimension;
        
        self.register(UINib.init(nibName: "UserTableCell", bundle: nil), forCellReuseIdentifier: "UserTableCell")
       
        self.backgroundColor = UIColor.clear
        self.separatorStyle = .none
        self.contentInset = UIEdgeInsets.init(top: 5, left: 0, bottom: 5, right: 0)
        
    }
    public func loadTableView(withUserList users:[User]){
        self.aryUserList = users
        self.delegate = self
        self.dataSource = self
    }
    public func setTableDidSelect(handler:((_ user:User,_ isSuccess:Bool)->Void)?){
        if let value = handler {
            self.didSelectTableCellHandler = value
        }
    }
}
extension DemoTableView:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableCell") as? UserTableCell {
            cell.updateCell(withUser: self.aryUserList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let handler = self.didSelectTableCellHandler{
            handler(self.aryUserList[indexPath.row],true)
        }
        
        
    }
}
