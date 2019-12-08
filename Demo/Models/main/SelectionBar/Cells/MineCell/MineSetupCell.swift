//
//  MineSetupCell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MineSetupCell: UITableViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "setting")
        return a
    }()
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    lazy private var toButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "mine_right"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = Configuration.getData()
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

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.deleteButton)
        self.contentView.addSubview(self.toButton)

        
        
        self.contentView.addSubview(self.line)

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(12)
            
        }
        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
       
        self.nameLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.headImage)
            make.left.equalTo(self.headImage.snp_rightMargin).offset(20)
            
        }
       
        self.toButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.headImage)
            make.right.equalTo(-12)

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
        
    }
    private func setLayoutForSelect(){
        self.nameLabel.font = Configuration.getFont()
           
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MineSetupCellModel{
            let m = aModel as! MineSetupCellModel

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

class MineSetupCellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 55, 50, 40)
    }
  
}
