//
//  ContactsTableViewCell.swift
//  Vovo
//
//  Created by Arun Jangid on 2/4/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ContactsTableViewCell: BaseTableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet var groupCollectionView: UICollectionView!
    
    var userDatasource = [[String:AnyObject]]()
    var memberList = List<GroupMember>()
    
    var datasource : Group  {
        get {
             return self.datasource
        }set {
            

            self.userName.text = newValue.groupName
            memberList = newValue.members
            
//            if newValue.profilePhoto != nil {
//                if (newValue.profilePhoto?.letterize().count)! > 0 {
//                    let url = URL(string: newValue.profilePhoto!)!
//                    let placeholderImage = UIImage(named: "profilePic")!
//                    profileImage.af_setImage(withURL: url, placeholderImage: placeholderImage)
//                    
//                }
//            }
//            
//            if newValue.groupPhoto != nil {
//                if (newValue.groupPhoto?.letterize().count)! > 0 {
//                    let url = URL(string: newValue.groupPhoto!)!
//                    let placeholderImage = UIImage(named: "profilePic")!
//                    profileImage.af_setImage(withURL: url, placeholderImage: placeholderImage)
//                    
//                }
//            }
       
            
            self.groupCollectionView.dataSource = self
            self.groupCollectionView.delegate = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memberList.count //userDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : GroupUserCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupUserCollectionViewCell", for: indexPath) as! GroupUserCollectionViewCell
        cell.datasource = memberList[indexPath.row]
        
        return cell
        
    }
}
