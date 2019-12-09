//
//  Content206Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content206Cell: UITableViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 12
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: "know_tou")
        return a
    }()
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.text = Configuration.getData()
        return a
    }()
    lazy private var toDoLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.textColor = UIColor.lightGray
        a.text = Configuration.getData()

        return a
    }()
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = Configuration.getData()
        a.textColor = UIColor.white
        a.numberOfLines = 1
        return a
    }()
    
    lazy private var bigenButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "start"), for: .normal)
        return a
    }()
    
    
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_15"))

        a.contentMode = .scaleAspectFill

        return a
    }()
    
    
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.headImage)
        self.contentView.addSubview(self.bigImage)

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.toDoLabel)
        self.contentView.addSubview(self.headerLabel)

        self.contentView.addSubview(self.bigenButton)
        self.contentView.addSubview(self.deleteButton)
        self.contentView.addSubview(self.line)

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.height.equalTo(30)
            make.width.equalTo(30)
            
        }
        self.deleteButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(0)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.headImage)
            make.left.equalTo(self.headImage.snp_rightMargin).offset(20)
            
        }
        
        self.toDoLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.headImage)
            make.left.equalTo(self.nameLabel.snp_rightMargin).offset(20)
            
        }
        
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(180)

        }
       
        
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            
        }
       
        self.bigenButton.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.bigImage)
            
        }
       
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
    private func setLayoutForEditor(){
        
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(120)

        }
        
    }
    private func setLayoutForSelect(){
        
        self.headerLabel.font = Configuration.getFont()
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(70)

        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content206CellModel{
            
            let m = aModel as! Content206CellModel
            Configuration.isHidden(self.deleteButton, m.status)
            if Configuration.instructions.previewDefault == false{
                if m.status == .select{
                   if Adapter.isPad(){
                        setLayoutForEditor()

                    }else{
                       setLayoutForSelect()
                   }
                                        
                }else{
                   setLayoutForEditor()
                }
                
            }
            deleteButton.v_click{
                
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

class Content206CellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 260, 190, 130)
    }
  
}
