//
//  ViewController.swift
//  Pirates
//
//  Created by Jack SP on 18/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogout(){
        UserDefaults.standard.set("0", forKey: "isLogin")
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let loginScreen = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            
            if let window = UIApplication.shared.keyWindow{
                    window.rootViewController = loginScreen
            }
           
                           
        }
    }

}

