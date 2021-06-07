//
//  SecondLayerChecklistViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 1/4/2564 BE.
//

import UIKit

class SecondLayerChecklistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var subjectTopic: UILabel!
    @IBOutlet weak var subjectImg: UIImageView!
    @IBOutlet weak var checklistTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistTableView.delegate = self
        checklistTableView.dataSource = self
        subjectTopic.text = ChecklistViewController.vc1.selectedSubjectLabel
        subjectImg.image = ChecklistViewController.vc1.selectedImg
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.title = "Select the test"
        let selectedImg = UIImage(systemName: "chevron.backward")?.resizedImage(Size: CGSize(width: 20, height: 20))
        //selectedImg?.withTintColor(.white)
        let selectedImgView = UIImageView(image: selectedImg)
        selectedImgView.image = selectedImgView.image?.withRenderingMode(.alwaysTemplate)
        selectedImgView.tintColor = UIColor.yellow
        
        let button = UIButton(type: .custom)
        button.tintColor = .white
        button.setImage(selectedImgView.image, for: .normal)
        button.backgroundColor = UIColor(hexString: "#f7cb6b")
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        print(selectedImgView.frame.width)
        print(selectedImgView.frame.height)
        button.frame = CGRect(x: 0, y: 0, width: selectedImgView.frame.width + 25 , height: selectedImgView.frame.height + 50)
        print(button.frame.width)
        print(button.frame.height)
        button.layer.cornerRadius = button.frame.width/2
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(Cellclass.self, forCellReuseIdentifier: "Cell")

    }
    
    
    
    
    
    
    
    
    @objc func popBack(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if checklistTableView == tableView{
            return 5
        }else{
            return dataSource.count
        }
    }
    
    var cell:checklistCell?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if checklistTableView == tableView{
            cell = checklistTableView.dequeueReusableCell(withIdentifier: "checklistCell") as! checklistCell
            cell?.layer.cornerRadius = 15
            cell?.checklistView.layer.cornerRadius = 15
            cell?.checklistView.backgroundColor = UIColor.gray.withAlphaComponent(0.15)
          //  cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell?.topicLbl.text = "Practice \(indexPath.row+1)"
            checklistTableView.separatorStyle = .none
            checklistTableView.showsVerticalScrollIndicator = false
            print("createddddd")
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
            cell.textLabel?.text = dataSource[indexPath.row]
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if checklistTableView == tableView{
            return 100
        }else{
            return 50
        }

    }
    
    var selectedButton = UIButton()
    var dataSource = [String]()
    let transparentView = UIView()
    let tableView = UITableView()
    
    @IBAction func dropDownBtnClicked(_ sender: Any) {
        print("clicked")
        dataSource = ["1.Basic Algebra","2.Basic Geometry","3.Advance Calculus","4.Advance Integration"]
        
        selectedButton = (cell?.deopDownBtn)!
        addTransparentView(frames: (cell?.deopDownBtn!.frame)!)
    }
    
    func addTransparentView(frames:CGRect){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        //SecondLayerChecklistViewController.vc1.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
       // SecondLayerChecklistViewController.vc1.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        
        //transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        tapGesture.cancelsTouchesInView = false
        transparentView.addGestureRecognizer(tapGesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width + 300, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView(){
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView{
            selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
            removeTransparentView()
            
            
            switch dataSource[indexPath.row]{
            case "0.5x":
                
                print("0.5 tapped")
            case "1.0x":
                
                print("1 tapped")
            case "1.5x":
                
                print("1.5 tapped")
            case "2.0x":
               
                print("2.0 tapped")
                
            default:

                print("normal tapped")
            }
        }
    }
    
    
    
    
}

class checklistCell:UITableViewCell{

    @IBOutlet weak var deopDownBtn: UIButton!
    var tickClicked = false
    @IBOutlet weak var checklistBtn: UIButton!
    @IBOutlet weak var checklistView: UIView!
    @IBOutlet weak var topicLbl: UILabel!
   
    override func awakeFromNib() {
       
    }
    @IBAction func tickBtnClicked(_ sender: Any) {
        if tickClicked == false{
            checklistBtn.setImage(UIImage(named: "tickGreen"), for: .normal)
            tickClicked.toggle()
        }else{
            checklistBtn.setImage(UIImage(named: "tickGrey"), for: .normal)
            tickClicked.toggle()
        }
    }

}



class Cellclass: UITableViewCell{
    
}
