//
//  partnerController.swift
//  WELC Map Test
//
//  Created by Andrea on 30/06/16.
//  Copyright © 2016 SPAM Concept srl. All rights reserved.
//
import UIKit


class partnerController: TemplateTableController  {
    
 var partnerImages=[String]()
     var partnerLabels=[String]()
override func viewDidLoad() {
        
        super.viewDidLoad()
    addSlideMenuButton()
        partnerImages=["partner_01",
        "partner_02",
        "partner_03_a",
        "partner_04",
        "partner_05",
        "partner_06",
        "partner_08",
        "partner_09",
        "partner_010",
              "partner_011",
        "partner_012",
        "partner_013",
        "partner_014",
        "partner_015",
        "partner_016",
        "partner_017",

        ]
 
    tableView.estimatedRowHeight=14
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell=self.tableView.dequeueReusableCellWithIdentifier("ImageTableCell", forIndexPath: indexPath ) as! partnerCell
            let row = indexPath.row
            cell.partnerImage.image=UIImage(named: partnerImages[row])
                       return cell
            
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return partnerImages.count
        }

    }



