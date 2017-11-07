//
//  ViewController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 10/27/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//



import UIKit
import Firebase
import FirebaseDatabase

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
      
    }
    
    @IBAction func SignUpButton(_ sender: Any)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }


}

