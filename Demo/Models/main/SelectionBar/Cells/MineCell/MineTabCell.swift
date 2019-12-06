//
//  MineTabCell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MineTabCell: UITableViewCell {
    
    lazy private var m:Vue = {
        let a = Vue()
        return a
    }()
    
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
   
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    var atable:CCollection?
    let layout = UICollectionViewFlowLayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        layout.itemSize = CGSize.init(width: WIDTH/3, height: 80)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.addSubview(table)
        table.backgroundColor = UIColor.clear
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        table.isScrollEnabled = false
        
        self.contentView.addSubview(self.deleteButton)

        self.deleteButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.right.equalTo(0)

        }
        
        
        self.contentView.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
   
    func setLayoutForEditor(){
        let w = self.contentView.frame.width
        layout.itemSize = CGSize.init(width: w/3, height: 60)

    }
    func setLayoutForSelect(){
          
        let w = self.contentView.frame.width
        layout.itemSize = CGSize.init(width: w/3, height: 50)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MineTabCellModel{
            
            let m = aModel as! MineTabCellModel
            
            Configuration.isHidden(self.deleteButton, m.status)
            if Configuration.instructions.previewDefault == false{
                
                if m.status == .select{
                    
                    setLayoutForSelect()
                    
                }else{
                    
                    setLayoutForEditor()
                }
            }
            
            var array = Array<VueData>()
            array.append(MineTabSubCellModel("mine_1","数据数据",m.status))
            array.append(MineTabSubCellModel("mine_2","数据数据",m.status))
            array.append(MineTabSubCellModel("mine_3","数据数据",m.status))
            array.append(MineTabSubCellModel("mine_4","数据数据",m.status))
            

            self.m.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                return array
            }
            self.m.v_index(vId: INDEXID) { (index) in
                
                m.v_identifier = 0
                m.v_to()
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

class MineTabCellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 80*2, 60*2, 50*2)  + 40
    }
  
}

