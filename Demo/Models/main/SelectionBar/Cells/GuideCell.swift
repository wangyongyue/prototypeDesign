//
//  GuideCell.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/6.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class GuideCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        label.text = "从下方的组件库中添加喜欢的组件吧！"
        label.font = UIFont.systemFont(ofSize: 14)
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
        self.contentView.addSubview(line)
        self.contentView.addSubview(headerLabel)
       
        headerLabel.snp.makeConstraints { (make) in
        
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.right.equalTo(-12)

        }
       
    
        line.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0)

        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is GuideCellModel{
            let m = aModel as! GuideCellModel
           
        }
    }
    
}
class GuideCellModel:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return 50
    }
    convenience init(_ a:String) {
        self.init()
        self.name = a
    }
  
}

