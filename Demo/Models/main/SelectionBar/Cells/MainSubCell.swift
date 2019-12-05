//
//  MainSubCell.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class MainSubCell: UICollectionViewCell {
    
    lazy private var headImage:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "m_delete"), for: .normal)
        a.contentMode = .scaleAspectFill
        return a
    }()
    
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = UIColor.black
        a.numberOfLines = 0
        a.layer.masksToBounds = true
        a.layer.cornerRadius = 10
        a.layer.borderColor = UIColor.lightGray.cgColor
        a.layer.borderWidth = 0.5
        a.font = UIFont.boldSystemFont(ofSize: 15)
        return a
    }()
   
   
   
          
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(frame: CGRect) {
    super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.headImage)
        
       
        self.contentView.addSubview(self.headerLabel)
      
        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)
          
            
        }
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)

        }
        
        
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MainSubCellModel{
            
            let m = aModel as! MainSubCellModel
            headerLabel.text = m.name
            self.headImage.v_click {
            
                m.v_identifier = 1
                m.v_to()
            }
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MainSubCellModel:VueData{
    
    var name:String?
    var data:VueData?
    convenience init(_ a:String) {
        self.init()
        name = a
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}

