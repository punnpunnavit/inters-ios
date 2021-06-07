//
//  QuestionViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 22/3/2564 BE.
//

import UIKit
class QuestionViewController:UIViewController{
    
    var studentBtnClicked = false
    var parentBtnClicked = false
    var othersBtnClicked = false
    var teacherBtnClicked = false
    var downTutorClicked = false
    var downSchoolClicked = false
    var downFriendClciked = false
    var downSocialMediaClicked = false
    var upperClicked = 0
    var downClicked = 0
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var downSocialBtn: UIButton!
    @IBOutlet weak var downFriendBtn: UIButton!
    @IBOutlet weak var downSchoolBtn: UIButton!
    @IBOutlet weak var downTutorBtn: UIButton!
    @IBOutlet weak var othersBtn: UIButton!
    @IBOutlet weak var teacherBtn: UIButton!
    @IBOutlet weak var parentBtn: UIButton!
    @IBOutlet weak var studentBtn: UIButton!
    @IBAction func continueBtnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    @IBAction func othersClicked(_ sender: Any) {
        if othersBtnClicked == false{
        othersBtn.setImage(UIImage(named: "othersinquestion")?.alpha(0.5), for: .normal)
            teacherBtnClicked = false
            teacherBtn.setImage(UIImage(named: "teacherinquestion")?.alpha(1), for: .normal)
            studentBtnClicked = false
            studentBtn.setImage(UIImage(named: "studentinquestion")?.alpha(1), for: .normal)
            parentBtnClicked = false
            parentBtn.setImage(UIImage(named: "parentinquestion")?.alpha(1), for: .normal)
            othersBtnClicked.toggle()
        }else{
            othersBtn.setImage(UIImage(named: "othersinquestion")?.alpha(1), for: .normal)
            othersBtnClicked.toggle()
        }
    }
    @IBAction func teacherClicked(_ sender: Any) {
        if teacherBtnClicked == false{
        teacherBtn.setImage(UIImage(named: "teacherinquestion")?.alpha(0.5), for: .normal)
            studentBtnClicked = false
            studentBtn.setImage(UIImage(named: "studentinquestion")?.alpha(1), for: .normal)
            parentBtnClicked = false
            parentBtn.setImage(UIImage(named: "parentinquestion")?.alpha(1), for: .normal)
            othersBtnClicked = false
            othersBtn.setImage(UIImage(named: "othersinquestion")?.alpha(1), for: .normal)
            teacherBtnClicked.toggle()
        }else{
           teacherBtn.setImage(UIImage(named: "teacherinquestion")?.alpha(1), for: .normal)
            teacherBtnClicked.toggle()
        }
    }
    @IBAction func studentClicked(_ sender: Any) {
        if studentBtnClicked == false{
        studentBtn.setImage(UIImage(named: "studentinquestion")?.alpha(0.5), for: .normal)
            teacherBtnClicked = false
            teacherBtn.setImage(UIImage(named: "teacherinquestion")?.alpha(1), for: .normal)
            parentBtnClicked = false
            parentBtn.setImage(UIImage(named: "parentinquestion")?.alpha(1), for: .normal)
            othersBtnClicked = false
            othersBtn.setImage(UIImage(named: "othersinquestion")?.alpha(1), for: .normal)
            studentBtnClicked.toggle()
            
        }else{
            studentBtn.setImage(UIImage(named: "studentinquestion")?.alpha(1), for: .normal)
            studentBtnClicked.toggle()
        }
        
    }
    @IBAction func parentClicked(_ sender: Any) {
        if parentBtnClicked == false{
           parentBtn.setImage(UIImage(named: "parentinquestion")?.alpha(0.5), for: .normal)
            studentBtnClicked = false
            studentBtn.setImage(UIImage(named: "studentinquestion")?.alpha(1), for: .normal)
            othersBtnClicked = false
            othersBtn.setImage(UIImage(named: "othersinquestion")?.alpha(1), for: .normal)
            teacherBtnClicked = false
            teacherBtn.setImage(UIImage(named: "teacherinquestion")?.alpha(1), for: .normal)
            parentBtnClicked.toggle()
        }else{
           parentBtn.setImage(UIImage(named: "parentinquestion")?.alpha(1), for: .normal)
            parentBtnClicked.toggle()
        }
    }
    @IBAction func downTutorClicked(_ sender: Any) {
        if downTutorClicked == false{
           downTutorBtn.setImage(UIImage(named: "where1inquestion")?.alpha(0.5), for: .normal)
            downSchoolClicked = false
            downSchoolBtn.setImage(UIImage(named: "where2inquestion")?.alpha(1), for: .normal)
            downFriendClciked = false
            downFriendBtn.setImage(UIImage(named: "where3question")?.alpha(1), for: .normal)
            downSocialMediaClicked = false
            downSocialBtn.setImage(UIImage(named: "where4inquestion")?.alpha(1), for: .normal)
            downTutorClicked.toggle()
        }else{
           downTutorBtn.setImage(UIImage(named: "where1inquestion")?.alpha(1), for: .normal)
            downTutorClicked.toggle()
        }
    }
    @IBAction func downschoolClicked(_ sender: Any) {
        if downSchoolClicked == false{
           downTutorBtn.setImage(UIImage(named: "where1inquestion")?.alpha(1), for: .normal)
            downSchoolClicked = false
            downSchoolBtn.setImage(UIImage(named: "where2inquestion")?.alpha(0.5), for: .normal)
            downFriendClciked = false
            downFriendBtn.setImage(UIImage(named: "where3question")?.alpha(1), for: .normal)
            downSocialMediaClicked = false
            downSocialBtn.setImage(UIImage(named: "where4inquestion")?.alpha(1), for: .normal)
            downSchoolClicked.toggle()
        }else{
           downSchoolBtn.setImage(UIImage(named: "where2inquestion")?.alpha(1), for: .normal)
            downSchoolClicked.toggle()
        }
    }
    @IBAction func downFriendClicked(_ sender: Any) {
        if downFriendClciked == false{
           downTutorBtn.setImage(UIImage(named: "where1inquestion")?.alpha(1), for: .normal)
            downSchoolClicked = false
            downSchoolBtn.setImage(UIImage(named: "where2inquestion")?.alpha(1), for: .normal)
            downFriendClciked = false
            downFriendBtn.setImage(UIImage(named: "where3question")?.alpha(0.5), for: .normal)
            downSocialMediaClicked = false
            downSocialBtn.setImage(UIImage(named: "where4inquestion")?.alpha(1), for: .normal)
             downFriendClciked.toggle()
        }else{
           downFriendBtn.setImage(UIImage(named: "where3question")?.alpha(1), for: .normal)
            downFriendClciked.toggle()
        }
    }
    @IBAction func downSocialClciked(_ sender: Any) {
        if downSocialMediaClicked == false{
           downTutorBtn.setImage(UIImage(named: "where1inquestion")?.alpha(1), for: .normal)
            downSchoolClicked = false
            downSchoolBtn.setImage(UIImage(named: "where2inquestion")?.alpha(1), for: .normal)
            downFriendClciked = false
            downFriendBtn.setImage(UIImage(named: "where3question")?.alpha(1), for: .normal)
            downSocialMediaClicked = false
            downSocialBtn.setImage(UIImage(named: "where4inquestion")?.alpha(0.5), for: .normal)
            downSocialMediaClicked.toggle()
        }else{
           downSocialBtn.setImage(UIImage(named: "where4inquestion")?.alpha(1), for: .normal)
            downSocialMediaClicked.toggle()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        //student button
        studentBtn.imageView?.contentMode = .scaleAspectFit
        studentBtn.imageEdgeInsets = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: -10)
        makeViewCircular(view: studentBtn)
        studentBtn.backgroundColor = UIColor(hexString: "FC814A")
        //parent button
        parentBtn.imageView?.contentMode = .scaleAspectFit
        parentBtn.imageEdgeInsets = UIEdgeInsets(top: -20, left: 10, bottom: 10, right: -5)
        makeViewCircular(view: parentBtn)
        parentBtn.backgroundColor = UIColor(hexString: "FEE440")
        //teacher button
        teacherBtn.imageView?.contentMode = .scaleAspectFit
        teacherBtn.imageEdgeInsets = UIEdgeInsets(top: -5, left: 15, bottom: 5, right: 10)
        makeViewCircular(view: teacherBtn)
        teacherBtn.backgroundColor = UIColor(hexString: "00BBF9")
        //others button
        othersBtn.imageView?.contentMode = .scaleAspectFit
        othersBtn.imageEdgeInsets = UIEdgeInsets(top: -15, left: 5, bottom: -5, right: 0)
        makeViewCircular(view: othersBtn)
        othersBtn.backgroundColor = UIColor(hexString: "FF6666")
        //FF6666
        
        //F15BB5
        
        //down Tutor
        downTutorBtn.backgroundColor = UIColor(hexString: "DF9A57")
        downTutorBtn.layer.cornerRadius = 15
        
        //down School
        downSchoolBtn.backgroundColor = UIColor(hexString: "FC7A57")
        downSchoolBtn.layer.cornerRadius = 15
        
        //down Friends
        
        downFriendBtn.backgroundColor = UIColor(hexString: "FCD757")
        downFriendBtn.layer.cornerRadius = 15
        
        //down Social Media
        
       downSocialBtn.backgroundColor = UIColor(hexString: "EEFC57")
       downSocialBtn.layer.cornerRadius = 15
        
       //continue btn
        continueBtn.layer.cornerRadius = 15
        
    }
    override func viewDidLoad() {
       
       
}
    func makeViewCircular(view: UIView) {
        view.layer.cornerRadius = view.bounds.size.width / 2.0
        view.clipsToBounds = true
    }
}

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
