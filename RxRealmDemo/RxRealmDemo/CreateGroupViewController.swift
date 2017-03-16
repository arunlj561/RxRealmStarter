//
//  CreateGroupViewController.swift
//  Vovo
//
//  Created by Arun Jangid on 3/15/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import RealmSwift
import IBAnimatable
import RxCocoa
import RxSwift

class CreateGroupViewController: BaseViewController {

    @IBOutlet weak var creategroupButton: UIBarButtonItem!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var groupNametextField: AnimatableTextField!
    @IBOutlet weak var groupImageView: AnimatableImageView!
    @IBOutlet weak var selectedContactCollectionView: UICollectionView!
    var newGroupCreated :((Group) -> ())!
    var datasource = ["1","7","17"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Group"
        
//        groupNametextField.rx.text.orEmpty
//            .map{ $0.letterize().count > 3}
//        .shareReplay(1)
//        .bindTo(creategroupButton.rx.isEnabled)
//        .addDisposableTo(self.disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func createGroup(){
        
        var member = [[String:[[String:String]]]]()
        for data in datasource{
            member.append(["request" :[["key": "UserId","value":data]]])
        }
        
//        let groupName = groupNametextField.text!
//        let userID = currentUser?.userRegistrationId!
      let param =  APIHandler.getStringFromParamsWithRequest(param: ["Members":member, "GroupInfo":[["key":"UserId","value":"16"],
                                                                                         ["key":"GroupName","value":"GroupName"],
                                                                                         ["key":"Photo","value":"https://cdn2.scratch.mit.edu/get_image/gallery/643756_200x130.png?v=1415377716.0"]]
            ])
       
        APIHandler.createMyGroup(param: param) { (data:Group) in
            self.newGroupCreated(data)
            self.navigationController?.popViewController(animated: true)
        }
        

    }
    
    
    @IBAction func createGroup(_ sender: Any) {
        self.createGroup()
    }

}
