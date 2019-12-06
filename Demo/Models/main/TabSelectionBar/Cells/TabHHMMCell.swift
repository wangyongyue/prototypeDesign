//
//  TabHHMMCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TabHHMMCell: UITableViewCell {
    
    let label1:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.textColor = Configuration.instructions.navigtaionTextColor()
         a.backgroundColor = UIColor.clear
         a.text = "tab1"
         a.font = UIFont.systemFont(ofSize: 13)
         return a
     }()
     let image1:UIImageView = {
         let a = UIImageView()
         a.image = UIImage.init(named: "konw_1")
         a.backgroundColor = UIColor.clear
         return a
     }()
     
     
     let label2:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.textColor = Configuration.instructions.navigtaionTextColor()
         a.backgroundColor = UIColor.clear
         a.font = UIFont.systemFont(ofSize: 13)
         a.text = "tab4"
         return a
     }()
     let image2:UIImageView = {
         let a = UIImageView()
         a.image = UIImage.init(named: "konw_1")
         a.backgroundColor = UIColor.clear
         return a
     }()
    
    let label3:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = Configuration.instructions.navigtaionTextColor()
        a.backgroundColor = UIColor.clear
        a.font = UIFont.systemFont(ofSize: 13)
        a.text = "tab3"
        return a
    }()
    let image3:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "konw_1")
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    
    
    let label4:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = Configuration.instructions.navigtaionTextColor()
        a.backgroundColor = UIColor.clear
        a.font = UIFont.systemFont(ofSize: 13)
        a.text = "tab2"
        return a
    }()
    let image4:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "konw_1")
        a.backgroundColor = UIColor.clear
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

         self.contentView.addSubview(image1)
         self.contentView.addSubview(label1)
     
         self.contentView.addSubview(image2)
         self.contentView.addSubview(label2)
        
        
        self.contentView.addSubview(image3)
        self.contentView.addSubview(label3)
        
        self.contentView.addSubview(image4)
        self.contentView.addSubview(label4)
     
         self.contentView.addSubview(line)
         self.contentView.addGestureRecognizer(self.tap)

        let w = self.contentView.frame.width

         image1.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/8)
         }
         label1.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/8)
         }
         image2.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/8*7)
         }
         label2.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/8*7)
         }
        image3.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/8*5)
        }
        label3.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/8*5)
        }
        image4.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/8*3)
        }
        label4.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/8*3)
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
         if aModel is TabHHMMCellModel{
             let m = aModel as! TabHHMMCellModel
             tap.v_tap {
                 m.v_to()
             }
         }
     }
    
}

class TabHHMMCellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 50, 80, 50)
    }
  
}
