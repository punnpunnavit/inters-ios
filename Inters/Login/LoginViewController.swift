//
//  LoginViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 20/3/2564 BE.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import FBSDKLoginKit


class LoginScreenViewController: UIViewController,GIDSignInDelegate {
    
    static let vc1 = LoginScreenViewController()
    var name = ""
    var url = ""
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
         // Perform any operations on signed in user here.
         let userId = user.userID                  // For client-side use only!
         let idToken = user.authentication.idToken
        print(user.authentication.accessToken)// Safe to send to the server
        print("using gmail")
        _ = user.profile.name
        _ = user.profile.givenName
        _ = user.profile.familyName
        _ = user.profile.email
        print(userId!)
        //print(idToken!)
        checkGmailToken(token: idToken!)
    }
    
    func facebookLogin(){
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile,.email], viewController: self) { (result) in
            switch result{
            case .cancelled :
                print("user canceled")
            case .failed(let error):
                print(error.localizedDescription)
            case .success(_,_,_):
                self.getFacebookData()
            }
        }
    }
    func getFacebookData(){
        if AccessToken.current != nil{
            GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.typr(large)"]).start { (connection, result, error) in
                if error == nil{
                    
                    let dict = result as! [String:AnyObject] as NSDictionary
                    let name = dict.object(forKey: "name") as! String
                    let id = dict.object(forKey: "id") as! String
                    
                    print(name)
                    print("//////////////" + AccessToken.current!.tokenString + "//////////////")
                    print(id)
                    print(dict)
                   
                    LoginScreenViewController.vc1.name = name
                    print("using facebook")
                    self.checkFBToken(token: AccessToken.current!.tokenString)
                   
                  
                }else{
                    print(error?.localizedDescription)
                }
            }
        }else{
            print("Accesstoken is nil")
        }
    }
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func FBBtn(_ sender: Any) {
        self.facebookLogin()
    }
    @IBAction func GmailBtn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func termsOfUseClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://lin.ee/2PyMHh7")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func privacyClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://lin.ee/2PyMHh7")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()

        GIDSignIn.sharedInstance()?.delegate = self

      // Automatically sign in the user.
     // GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        
      // ...
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("NotificationName"),
                                               object: nil)
    }
    
    @objc func handleMassage(notification: NSNotification) {
       print("gufoufuofuofufouufoufufo")
   }
    
    
    func checkGmailToken(token:String){
        self.performSegue(withIdentifier: "gotoask", sender: self)
    }
    
    func checkFBToken(token:String){
        self.performSegue(withIdentifier: "gotoask", sender: self)
    }
    
    
}
