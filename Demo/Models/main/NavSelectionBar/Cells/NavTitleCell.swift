//
//  NavTitleCell.swift
//  Demo
//
//  Created by apple on 2019/11/13.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class NavTitleCell: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(line)

        headerLabel.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.contentView)
        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(-0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
        
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is NavTitleCellModel{
            let m = aModel as! NavTitleCellModel
            
            headerLabel.text = m.name

        }
    }
    
}
class NavTitleCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        
        return Adapter.topNavigation()
    }
  
}

