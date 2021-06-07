//
//  ProfileViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 24/3/2564 BE.
//

import UIKit
import MessageUI
import BLTNBoard


class ProfileViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
   
    @IBOutlet weak var lineBtn: UIButton!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var mailBtn: UIButton!
    var item = BLTNPageItem(title: "Help")
    
    
    
    @IBAction func howCanIUnlockMyCourse(_ sender: Any) {
        DispatchQueue.main.async {
            self.item.descriptionText = "Coming Soon"
            self.boardManager.showBulletin(above: self)
        }
        
    }
    
    @IBAction func mailBtnClicked(_ sender: Any) {
        
        print("cleck")
        
        showMailComposer()
    }
    @IBAction func iCantActivateMyCourse(_ sender: Any) {
        DispatchQueue.main.async {
            self.item.descriptionText = "Coming Soon"
            self.boardManager.showBulletin(above: self)
        }
    }
    @IBAction func somethingWentWrong(_ sender: Any) {
        self.item.descriptionLabel?.numberOfLines = 0
        self.item.descriptionLabel?.textAlignment = NSTextAlignment.right
        self.item.descriptionLabel?.sizeToFit()
        self.item.descriptionText = "1. Check your internet connection\n2. Contact us via Email or Line"
            self.boardManager.showBulletin(above: self)
        
    }
    

    
    @IBAction func iCantPostCommentInCommunity(_ sender: Any) {
        DispatchQueue.main.async {
            self.item.descriptionText = "Coming Soon"
            self.boardManager.showBulletin(above: self)
        }
    }
    
    @IBAction func lineBtnClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://lin.ee/2PyMHh7")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func shareBtnClicked(_ sender: Any) {
        
        let text = "inters แอพพลิเคชั่นอันดับ 1 เพื่อการสอบอินเตอร์"
        let URL = NSURL(string: "https://apps.apple.com/th/app/roblox/id431946152")
        
        let vc = UIActivityViewController(activityItems: [text,URL!], applicationActivities: [])
        if let popoverController = vc.popoverPresentationController{
            popoverController.sourceView = self.view
            popoverController.sourceRect = self.view.bounds
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
     
    private lazy var boardManager:BLTNItemManager = {
        item.actionButtonTitle = "Dismiss"
        
        item.actionHandler = {_ in
            ScoreCalculationViewController.didTapBoardContinue()
        }
        
        item.alternativeHandler = { _ in
            ScoreCalculationViewController.didTapBoardSkip()
            
        }
        
        item.appearance.actionButtonColor = .systemPink
        item.appearance.alternativeButtonTitleColor = .gray
        
        
        return BLTNItemManager(rootItem: item)
    }()
    
    static func didTapBoardContinue(){
        
    }
    
    static func didTapBoardSkip(){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailBtn.backgroundColor = .white
        mailBtn.frame = CGRect(x: lineBtn.frame.origin.x + 60, y: lineBtn.frame.origin.y, width: 47, height: 47)
        mailBtn.imageView?.contentMode = .scaleAspectFit
        mailBtn.layer.cornerRadius = mailBtn.frame.height/2
        mailBtn.imageView?.layer.cornerRadius = mailBtn.frame.height/2
        transparentView.backgroundColor = UIColor(hexString: "#808080", alpha: 0.25)
        transparentView.layer.cornerRadius = 15
        transparentView.layer.borderWidth = 0.2
        transparentView.layer.borderColor = UIColor.gray.cgColor
      
    }

    func showMailComposer(){
        guard MFMailComposeViewController.canSendMail() else {
           print("nah")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setSubject("Contact Admin")
        composer.setToRecipients(["hotshotdevbkk@gmail.com"])
        present(composer, animated: true)
        
            }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error{
            controller.dismiss(animated: true, completion: nil)
            return
        }
        
        switch result{
        case .cancelled:
            print("canceled")
            controller.dismiss(animated: true, completion: nil)
        case .failed
        : print("failed")
            controller.dismiss(animated: true, completion: nil)
        case .saved:
            print("saved")
            controller.dismiss(animated: true, completion: nil)
        case .sent:
            print("sent")
            controller.dismiss(animated: true, completion: nil)
        }
        


}

}


