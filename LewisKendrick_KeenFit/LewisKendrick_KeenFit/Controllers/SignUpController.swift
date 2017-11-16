//
//  SignUpController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/14/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

/*TODO: issue: user must tap the sign in button twice before segue
 */

import UIKit
import Firebase

class SignUpController: UIViewController ,UITextFieldDelegate {

    var ref: DatabaseReference!
    
    
    @IBOutlet weak var _Image: UIImageView!
    @IBOutlet weak var _Name: UITextField!
    @IBOutlet weak var _Email: UITextField!
    @IBOutlet weak var _Password: UITextField!
    
    
    //setting up my var's
    var iconSelection = 1
    var nameSelection = ""
    var emailSelection = ""
    var passwordSelection = ""
    var created = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("Users")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignInPressed(_ sender: Any)
    {
       let correctCheck = VerifyFields()
       if correctCheck == true
       {
        CreateUser()
       }
       else
       {
        //if any is empty I will then stop the user
        let alertController: UIAlertController = UIAlertController(title: "", message: "Make sure you complete all fields!", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
       }
   
    }
    
    @IBAction func BackPressed(_ sender: Any)
    {
     navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NextButtonPressed(_ sender: Any)
    {
        if iconSelection >= 0
        {
        iconSelection += 1
        }
        if iconSelection > 10
        {
            iconSelection = 1
        }
        _Image.image = UIImage(named: "\(iconSelection)")
        
        print(iconSelection)
    }
    
    @IBAction func PrevButtonPressed(_ sender: Any)
    {
        if iconSelection <= 1
        {
            iconSelection = 10
        }
        else if iconSelection <= 11
        {
          iconSelection -= 1
        }
        _Image.image = UIImage(named: "\(iconSelection)")
        
        print(iconSelection)
    }
    
    func VerifyFields() -> Bool
    {
        
        if _Name.text?.isEmpty == true
        {
            return false
        }
        else
        {
            nameSelection = _Name.text!
        }
        
        if _Email.text?.isEmpty == true
        {
            return false
        }
            
        else
        {
            emailSelection = _Email.text!
        }
        
        if _Password.text?.isEmpty == true
        {
            return false
        }
        
        else
        {
            passwordSelection = _Password.text!
        }
        
        return true
    }
    
    func CreateUser()
    {
        Auth.auth().createUser(withEmail: emailSelection, password: passwordSelection) { (user, error) in
            
            if let u = user
            {
                g_UserID = u.uid
                
                let post = [
                    "name": self.nameSelection,
                    "id_picture": self.iconSelection,
                    "g_name": "N/A",
                    "weight": 0.0,
                    "average_daily": 0.0,
                    "average_weekly": 0.0,
                    "average_biWeekly": 0.0
                    ] as [String : Any]
                g_pictureID = self.iconSelection
                self.ref.child(g_UserID!).setValue(post)
                self.created = true
            }
            else
            {
                self.created = false
            }
            
            if self.created == true
            {
                self.performSegue(withIdentifier: "toHome", sender: self)
            }
        }
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
