//
//  LoginViewController.swift
//  Pirates
//
//  Created by Jack SP on 18/02/22.
//

import UIKit
@objc protocol HomeModelViewProtocol {
    @objc optional func handleSuccessUserList()
}
class LoginViewController: UIViewController,HomeModelViewProtocol {

    @IBOutlet weak var tblUserList:DemoTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnLogin(){
        UserDefaults.standard.set("1", forKey: "isLogin")
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let homeTabbar = mainStoryboard.instantiateViewController(withIdentifier: "tabbarController") as? UITabBarController{
            homeTabbar.modalPresentationStyle = .fullScreen
            homeTabbar.modalTransitionStyle = .coverVertical
            if let window = UIApplication.shared.keyWindow{
                    window.rootViewController = homeTabbar
            }
        }
    }

    private func callUserListAPI(){
        let aryUserList:[User] = []
        self.tblUserList.loadTableView(withUserList: aryUserList)
        
//        self.tblUserList.didSelectTableCellHandler = {
//            (object) in
//
//        }
        
        self.tblUserList.setTableDidSelect { (user,isError) in
            
            print(user.strName)
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
//    func f_name(argument)->returnType{
//
//    }
}
