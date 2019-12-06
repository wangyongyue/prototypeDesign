//
//  EditorLRCell.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class EditorLRCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let headerImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "r_1")
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
        self.contentView.addSubview(line)
        self.contentView.addSubview(headerLabel)
       self.contentView.addSubview(headerImage)
    self.contentView.addGestureRecognizer(tap)
        headerImage.snp.makeConstraints { (make) in
        
            make.top.equalTo(10)
            make.centerX.equalTo(self.contentView)

        }
        headerLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(self.headerImage.snp_bottomMargin).offset(10)
            make.left.equalTo(12)
            make.right.equalTo(-12)

        }
       
    
        line.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is EditorLRCellModel{
            let m = aModel as! EditorLRCellModel
           
            headerLabel.text = m.name
            headerImage.image = m.img
            tap.v_tap {
                
                m.v_to()
            }

        }
    }
    
}
class EditorLRCellModel:VueData{
    
    var name:String?
    var img:UIImage?
    override func v_height() -> CGFloat {
        return 60
    }
    convenience init(_ a:String,_ b:String) {
        self.init()
        self.name = a
        self.img = UIImage.init(named: b)
    }
  
}

