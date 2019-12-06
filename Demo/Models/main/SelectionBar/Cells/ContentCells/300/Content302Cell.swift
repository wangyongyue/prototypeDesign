
//
//  Content302Cell.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content302Cell: UITableViewCell {
    
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
        
        
        
        layout.itemSize = CGSize.init(width: 300, height: 270)
        layout.scrollDirection = .horizontal
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
        
        let w = self.contentView.frame.width
        layout.itemSize = CGSize.init(width: 230, height: 200)

    }
    private func setLayoutForSelect(){
        let w = self.contentView.frame.width
        layout.itemSize = CGSize.init(width: 160, height: 130)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content302CellModel{
            
            let m = aModel as! Content302CellModel
            
            var array = Array<VueData>()
            array.append(Content300CellModel(Image.fillImage("feng_8"),m.status))
            array.append(Content300CellModel(Image.fillImage("feng_8"),m.status))
            array.append(Content300CellModel(Image.fillImage("feng_8"),m.status))
            array.append(Content300CellModel(Image.fillImage("feng_8"),m.status))
            array.append(Content300CellModel(Image.fillImage("feng_8"),m.status))

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


class Content302CellModel:BaseData{
    
    var name:String?
    override func v_height() -> CGFloat {
        return Configuration.getCellHeight(status, 270, 200, 130)
    }
  
}
