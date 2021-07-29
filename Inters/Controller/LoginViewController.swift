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
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    static let vc1 = LoginScreenViewController()
    var facebookManager = MyFacebookManager()
    var name = ""
    
    @IBAction func FBBtn(_ sender: Any) {
        facebookManager.facebookLogin()
    }
    @IBAction func GmailBtn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookManager.delegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("NotificationName"),
                                               object: nil)
    }
    
    
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
    
    
    @objc func handleMassage(notification: NSNotification) {
        print("Hello World")
    }
    
    func checkGmailToken(token:String){
        self.performSegue(withIdentifier: "gotoask", sender: self)
    }
    
    func checkFBToken(token:String){
        self.performSegue(withIdentifier: "gotoask", sender: self)
    }
    
    
    
    
    //MARK:- Terms of Use and Privacy Policy Section
    
    @IBAction func termsOfUseClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://lin.ee/2PyMHh7")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func privacyClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://lin.ee/2PyMHh7")! as URL, options: [:], completionHandler: nil)
    }
    
}


////////////////////////////
extension LoginScreenViewController:MyFacebookManagerDelegate{
    
    func sendUsersData(_ weatherManager: MyFacebookManager, data: FacebookModel) {
        print("hi")
    }
    
    func didFailWithError(error: Error) {
        print("hi")
    }
    
    
}
