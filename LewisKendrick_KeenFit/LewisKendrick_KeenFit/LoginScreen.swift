//
//  ViewController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 10/27/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//



import UIKit
import Firebase

var g_UserID:String? //using a global uid to help me search through my database

class LoginScreenContoller: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
 
    var ref: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignInButton(_ sender: Any)
    {
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            //if user isnt nil then the person is found and i will go to mainpage
            if let u = user
            {
                g_UserID = u.uid
                
                self.performSegue(withIdentifier: "toMainScreen", sender: self)
            }
            else
            {
                //check errr and show message            }
            }
        }
    }
    
    @IBAction func SignUpButton(_ sender: Any)
    {
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            
            if let u = user
            {
                g_UserID = u.uid
                //user is found go to login screen
                self.performSegue(withIdentifier: "toMainScreen", sender: self)
            }
            else
            {
                //show error message
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }


}


