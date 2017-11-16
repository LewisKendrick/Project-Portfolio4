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
var g_pictureID = 1
var g_CurrentPerson = Person()

class LoginScreenContoller: UIViewController, UITextFieldDelegate {
    
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
               
            }
        }
    }
    
    @IBAction func SignUpButton(_ sender: Any)
    {
                self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
       txtPassword.text = ""
    }
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool)
    {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("moveTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        moveTextField(textField: textField, moveDistance: -250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        moveTextField(textField: textField, moveDistance: -250, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

}


