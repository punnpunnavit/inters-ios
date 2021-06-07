//
//  MockTestViewController.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 8/4/2564 BE.
//

import UIKit

class MockTestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    static let vc1 = MockTestViewController()
    var selectedSubjectLabel:String?
    var selectedImg:UIImage?
    var subjects = ["SAT Verbal","SAT Math","CU-ATS","CU-TEP","GED","GSAT","IELTS","IGCSE","SAT Biology","SAT Chemistry","SAT Math Lv.2","TU-GET","SAT Physics","A-Level"]
    let subjectsImg = [UIImage(named: "satverbal"),UIImage(named: "satmath"),UIImage(named: "cuats"),UIImage(named: "cutep"),UIImage(named: "ged"),UIImage(named: "gsat"),UIImage(named: "ielts"),UIImage(named: "igcse"),UIImage(named: "satbio"),UIImage(named: "satchem"),UIImage(named: "satmathlv2"),UIImage(named: "tuget"),UIImage(named: "satphysics"),UIImage(named: "alevel")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subjectTableView.dequeueReusableCell(withIdentifier: "subjectMockTestCell") as! subjectCellMockTest
        let subjectName = subjects[indexPath.row]
        cell.subjectLbl.text = subjectName
        cell.subjectImgView.image = subjectsImg[indexPath.row]
        cell.subjectImgView.frame = CGRect(x: cell.subjectView.frame.midX, y: 0, width: 150, height: 150)
        cell.subjectImgView.contentMode = .scaleAspectFit
        cell.subjectImgView.backgroundColor = .clear
        cell.subjectView.layer.cornerRadius = 15
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           MockTestViewController.vc1.selectedSubjectLabel = subjects[indexPath.row]
           MockTestViewController.vc1.selectedImg = subjectsImg[indexPath.row]
           self.performSegue(withIdentifier: "goInsideMock", sender: self)
        
        

    }
    
   
    @IBOutlet weak var subjectTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.separatorStyle = .none
        subjectTableView.showsVerticalScrollIndicator = false
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
        
    }
    
    @objc func popBack(){
        _ = navigationController?.popViewController(animated: true)
    }
}


class subjectCellMockTest:UITableViewCell{
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var subjectView: UIView!
    @IBOutlet weak var subjectImgView: UIImageView!
    override func awakeFromNib() {
        
    }
}
