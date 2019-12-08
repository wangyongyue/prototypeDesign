//
//  NavBackCell.swift
//  Demo
//
//  Created by apple on 2019/11/14.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

import VueSwift
class NavBackCell: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let backImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "back")
        return a
    }()
    let line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
    let tap = UITapGestureRecognizer()

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = UIColor.clear
    self.contentView.addSubview(headerLabel)
    self.contentView.addSubview(backImage)
    self.contentView.addSubview(line)

    if Configuration.instructions.tabBarBackgroundColor() == UIColor.black{
        backImage.image = UIImage.init(named: "back_w")
    }

    headerLabel.snp.makeConstraints { (make) in
        
        make.center.equalTo(self.contentView)
    }
    backImage.snp.makeConstraints { (make) in
        make.left.equalTo(10)
        make.centerY.equalTo(self.contentView)

    }
    backImage.isUserInteractionEnabled = true
    backImage.addGestureRecognizer(tap)
    
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
        if aModel is NavBackCellModel{
            let m = aModel as! NavBackCellModel
            
            headerLabel.text = m.name

            tap.v_tap {
                m.v_to()
            }
        }
    }
    
}
class NavBackCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        
        return Adapter.topNavigation()
    }
  
}

