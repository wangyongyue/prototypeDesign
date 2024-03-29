//
//  TabHHSMMCell.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TabHHSMMCell: UITableViewCell {
    
    let label1:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.textColor = Configuration.instructions.navigtaionTextColor()
         a.backgroundColor = UIColor.clear
         a.text = "Tab1"
         a.font = UIFont.systemFont(ofSize: 13)
         return a
     }()
     let image1:UIButton = {
         let a = UIButton()
         a.setImage(UIImage.init(named: "z_1"), for: .selected)
         a.setImage(UIImage.init(named: "z_2"), for: .normal)

         a.backgroundColor = UIColor.clear
         return a
     }()
     
     
     let label2:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.textColor = Configuration.instructions.navigtaionTextColor()
         a.backgroundColor = UIColor.clear
         a.font = UIFont.systemFont(ofSize: 13)
         a.text = "Tab5"
         return a
     }()
     let image2:UIButton = {
         let a = UIButton()
         a.setImage(UIImage.init(named: "z_1"), for: .selected)
         a.setImage(UIImage.init(named: "z_2"), for: .normal)

         a.backgroundColor = UIColor.clear
         return a
     }()
    
    let label3:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = Configuration.instructions.navigtaionTextColor()
        a.backgroundColor = UIColor.clear
        a.font = UIFont.systemFont(ofSize: 13)
        a.text = "Tab4"
        return a
    }()
    let image3:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "z_1"), for: .selected)
        a.setImage(UIImage.init(named: "z_2"), for: .normal)

        a.backgroundColor = UIColor.clear
        return a
    }()
    
    
    
    let label4:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = Configuration.instructions.navigtaionTextColor()
        a.backgroundColor = UIColor.clear
        a.font = UIFont.systemFont(ofSize: 13)
        a.text = "Tab2"
        return a
    }()
    let image4:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "z_1"), for: .selected)
        a.setImage(UIImage.init(named: "z_2"), for: .normal)

        a.backgroundColor = UIColor.clear
        return a
    }()
    
    let label5:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = Configuration.instructions.navigtaionTextColor()
        a.backgroundColor = UIColor.clear
        a.font = UIFont.systemFont(ofSize: 13)
        a.text = "Tab3"
        return a
    }()
    let image5:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "z_1"), for: .selected)
        a.setImage(UIImage.init(named: "z_2"), for: .normal)

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
        
         self.contentView.addSubview(image5)
         self.contentView.addSubview(label5)
     
         self.contentView.addSubview(line)
         self.contentView.addGestureRecognizer(self.tap)
        
         let w = Adapter.width()


         image1.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/12)
         }
         label1.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/12)
         }
         image2.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/12*11)
         }
         label2.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/12*11)
         }
        image3.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*8.5)
        }
        label3.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*8.5)
        }
        image4.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*3.5)
        }
        label4.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*3.5)
        }
        
        image5.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*6)
        }
        label5.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*6)
        }
         
         line.snp.makeConstraints { (make) in
             make.top.equalTo(0)
             make.left.equalTo(0)
             make.right.equalTo(0)
             make.height.equalTo(0.5)

         }
        image1.isSelected = true

     
     }
    private func setLayoutForSelect(){
    
        let w = Adapter.Pad(WIDTHPAD, WIDTH * bili)

        image1.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/12)
         }
         label1.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/12)
         }
         image2.snp.makeConstraints { (make) in
             make.bottom.equalTo(-20)
             make.centerX.equalTo(w/12*11)
         }
         label2.snp.makeConstraints { (make) in
             make.bottom.equalTo(0)
             make.centerX.equalTo(w/12*11)
         }
        image3.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*8.5)
        }
        label3.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*8.5)
        }
        image4.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*3.5)
        }
        label4.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*3.5)
        }
        
        image5.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(w/12*6)
        }
        label5.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(w/12*6)
        }
    
    }
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
     }
     override func setV_Model(_ aModel: VueData) {
         if aModel is TabHHSMMCellModel{
             let m = aModel as! TabHHSMMCellModel
            
            if Configuration.instructions.previewDefault == false{
                           if m.status == .select{
                              setLayoutForSelect()
                           }
                       }
             
             if m.status == .edit{
                 
                 tap.v_tap {
                     m.v_identifier = 0
                     m.v_to()
                 }
             }
             image1.v_click { [weak self] in
                   m.v_identifier = 0
                   m.v_to()
                   
                   self?.image1.isSelected = true
                   self?.image2.isSelected = false
                   self?.image3.isSelected = false
                   self?.image4.isSelected = false
                   self?.image5.isSelected = false

               }
               image2.v_click { [weak self] in
                   m.v_identifier = 4
                   m.v_to()
                   
                   self?.image1.isSelected = false
                   self?.image2.isSelected = true
                   self?.image3.isSelected = false
                   self?.image4.isSelected = false
                self?.image5.isSelected = false

               }
              image3.v_click { [weak self] in
                  m.v_identifier = 3
                  m.v_to()
                  
                  self?.image1.isSelected = false
                  self?.image2.isSelected = false
                  self?.image3.isSelected = true
                  self?.image4.isSelected = false
                self?.image5.isSelected = false


              }
             image4.v_click { [weak self] in
                 m.v_identifier = 1
                 m.v_to()
                 
                 self?.image1.isSelected = false
                 self?.image2.isSelected = false
                 self?.image3.isSelected = false
                 self?.image4.isSelected = true
                self?.image5.isSelected = false


             }
            image5.v_click { [weak self] in
                m.v_identifier = 2
                m.v_to()
                
                self?.image1.isSelected = false
                self?.image2.isSelected = false
                self?.image3.isSelected = false
                self?.image4.isSelected = false
                self?.image5.isSelected = true


            }
         }
     }
    
}

class TabHHSMMCellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        if status == .edit{
            return 80
        }
        return 50
    }
  
}

