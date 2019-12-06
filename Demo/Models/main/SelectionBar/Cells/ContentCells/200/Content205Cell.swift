//
//  Content205Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content205Cell: UITableViewCell {
    
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
        a.text = "数据数据数"
        return a
    }()
    lazy private var toDoLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.textColor = UIColor.lightGray
        a.text = "数据数据数据数据数据数据数据数据数据数据"
        a.numberOfLines = 1

        return a
    }()
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "数据数据数据数据数据数据数据数据数据数据数据数据"
        a.numberOfLines = 1
        return a
    }()
    
    lazy private var zhuanButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_share"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        return a
    }()
    
    lazy private var pinglunButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_pinglun"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        return a
    }()
    
    lazy private var zanButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "know_zan"), for: .normal)
        a.setTitle("数据", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return a
    }()
    
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_4"))
        a.contentMode = .scaleAspectFill

        return a
    }()
    
    lazy private var bigImage1:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_4"))
        a.contentMode = .scaleAspectFill

        return a
    }()
    
    lazy private var bigImage2:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_4"))
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
        self.contentView.addSubview(self.bigImage1)
        self.contentView.addSubview(self.bigImage2)

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.toDoLabel)
        self.contentView.addSubview(self.headerLabel)

        self.contentView.addSubview(self.zhuanButton)
        self.contentView.addSubview(self.pinglunButton)
        self.contentView.addSubview(self.zanButton)
        
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
            
            make.top.equalTo(self.headImage)
            make.left.equalTo(self.headImage.snp_rightMargin).offset(10)
            make.right.equalTo(-12)

        }
        self.toDoLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.nameLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(self.headImage.snp_rightMargin).offset(10)
            make.right.equalTo(-12)

        }
       
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(self.headImage)
            make.right.equalTo(-12)
            
        }
        
        let w = 100
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage1.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(20)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage2.snp.makeConstraints { (make) in

            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(self.bigImage1.snp_rightMargin).offset(20)
            make.height.equalTo(w)
            make.width.equalTo(w)

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
        let w = 80
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage1.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(10)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage2.snp.makeConstraints { (make) in

            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(self.bigImage1.snp_rightMargin).offset(10)
            make.height.equalTo(w)
            make.width.equalTo(w)

        }
        
    }
    private func setLayoutForSelect(){
        
        self.headerLabel.font = Configuration.getFont()
        let w = 50
        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(12)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage1.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(10)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage2.snp.makeConstraints { (make) in

            make.top.equalTo(self.headerLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(self.bigImage1.snp_rightMargin).offset(10)
            make.height.equalTo(w)
            make.width.equalTo(w)

        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content205CellModel{
            
            let m = aModel as! Content205CellModel
            Configuration.isHidden(self.deleteButton, m.status)
            if Configuration.instructions.previewDefault == false{
                if m.status == .select{
                   setLayoutForSelect()
                                        
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

class Content205CellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 250, 180, 130)
    }
  
}
