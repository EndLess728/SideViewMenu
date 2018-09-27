//
//  ViewController.swift
//  SideViewMenu
//
//  Created by MacMini on 9/27/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {


    @IBOutlet weak var mySideView: UIView!
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    var isSideViewOpen:Bool = false
    
    let sideBarMenu = ["Profile","Account","Settings","Security","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // Hide the View on Launch
        mySideView.isHidden = true
        sideMenuTableView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        
    }

    
    // Table View Methods For Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideBarMenu.count
    }
    
    
    //Table View Method for CellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! myTabelViewCell
        cell.myCellLabel.text = sideBarMenu[indexPath.row]
        
        return cell
        
    }
    
    // Action Perforrm on Cliking sidemenu Button
    @IBAction func sideMenuButton(_ sender: UIButton) {
        
        mySideView.isHidden = false
        sideMenuTableView.isHidden = false
        self.view.bringSubview(toFront: mySideView)
        
        
       // if button is clicked show the sidebar view
        if !isSideViewOpen{
            
            isSideViewOpen = true
            
            // SideView Dimensions programatically
            mySideView.frame = CGRect(x: 0, y: 64, width: 0, height: 348)
            //tableview Dimentions Programatically
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 348)
            
        // UIView animations properties
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            
            // SideView Dimensions programatically
            mySideView.frame = CGRect(x: 0, y: 64, width: 171, height: 348)
            //tableview Dimentions Programatically
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 171, height: 348)
            
            UIView.commitAnimations()
        }else{
            
        // if button is Clicked again then hide the sidebar view
            
            mySideView.isHidden = true
            sideMenuTableView.isHidden = true
            isSideViewOpen = false
            
            // SideView Dimensions programatically
            mySideView.frame = CGRect(x: 0, y: 64, width: 171, height: 348)
            //tableview Dimentions Programatically
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 171, height: 348)
            
         // UIView animations properties
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            
            // SideView Dimensions programatically
            mySideView.frame = CGRect(x: 0, y: 64, width: 0, height: 348)
            //tableview Dimentions Programatically
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 348)
            
            UIView.commitAnimations()
        }
    }
    
}

