//
//  ContactsViewController.swift
//  Vovo
//
//  Created by Arun Jangid on 2/4/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import RxCocoa
import RxRealm
import RxSwift


class GroupViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
  
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var datasource : Results<Group>!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        self.addObservers()
        
        self.title  = "Groups"
        
    }
    
    func addObservers(){
        
        let realm = try! Realm()
        self.datasource = realm.objects(Group.self).filter(NSPredicate(format: "groupId != nil"))
        
        
        
        
        
           addButton.rx.tap
            .subscribe(onNext: {
             self.performSegue(withIdentifier: "CreateGroupViewController", sender: nil)
            }).addDisposableTo(self.disposeBag)
        
        Observable.collection(from: datasource)
            .map {results in "laps: \(results.count)"}
            .subscribe { event in
                self.title = event.element
            }
            .addDisposableTo(disposeBag)
        
        Observable.changeset(from: self.datasource)
            .subscribe(onNext: {[unowned self] results, changes in
                if let changes = changes {
                    
                    self.contactsTableView.applyChangeset(changes)
                    
                } else {
                    self.contactsTableView.reloadData()
                }
            })
            .addDisposableTo(self.disposeBag)

        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contactsTableView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
        self.hidesBottomBarWhenPushed = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
            cell.datasource = datasource[indexPath.row] 
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // TODO -  filter datasource
    }


    @IBAction func actionCreateGroup(_ sender: Any) {
        
           }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier  {
        case "CreateGroupViewController"?:
            let destinationVc : CreateGroupViewController = segue.destination as! CreateGroupViewController
            destinationVc.newGroupCreated = { group in
                let realm = try! Realm()
               try! realm.write {
                    print(self.datasource.count)
                    realm.add(group)
                    print(self.datasource.count)
                }
            }
            
            break
        default:
            break
        }
        self.hidesBottomBarWhenPushed = true

        
        
    }

}
