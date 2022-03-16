//
//  ViewController.swift
//  Pirates
//
//  Created by Jack SP on 18/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chipCollectionView:ChipCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.openChipCollectionView()
    }

    func openChipCollectionView(){
        self.chipCollectionView.loadBooks(withBooks: ["Hello","hi","how are you?","The kashmir files"])
        
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

