//
//  BannerCell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class BannerCell: UITableViewCell {
    
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
    let layout = UICollectionViewFlowLayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        layout.itemSize = CGSize.init(width: WIDTH - 30, height: 160)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.addSubview(table)
        table.backgroundColor = UIColor.clear
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(20)
            make.left.equalTo(15)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        
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
    
    
    
    private func setLayoutForEditor(){
        
        layout.itemSize = CGSize.init(width: WIDTH * bili - 30, height: 120)

    }
    private func setLayoutForSelect(){
      
        if Adapter.isPad(){
            layout.itemSize = CGSize.init(width: WIDTHPAD - 30, height: 120)

        }else{
            layout.itemSize = CGSize.init(width: WIDTH/3 - 20, height: 80)

        }


    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is BannerCellModel{
            
            let m = aModel as! BannerCellModel
            
            var array = Array<VueData>()

            array.append(BannerSubCellModel(Image.fillImage("banner_1")))
            array.append(BannerSubCellModel(Image.fillImage("banner_2")))
            array.append(BannerSubCellModel(Image.fillImage("banner_3")))
            self.m.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                return array
            }
            self.m.v_index(vId: INDEXID) { (index) in
                
                m.v_identifier = 0
                m.v_to()
            }
            
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


class BannerCellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 180, 150, Adapter.Pad(150, 100) )
    }
  
}
