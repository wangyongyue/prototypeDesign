//
//  TabTableCell.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/7.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class TabTableCell: UICollectionViewCell {
    
    let table = CTable()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(table)
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is TabTableCellModel{
            let m = aModel as! TabTableCellModel
            table.array = m.array
            table.reloadData()
            table.v_didSelect { (index) in
                
                m.v_identifier = index
                m.v_to()
            }
        }
    }
    
}
class TabTableCellModel:VueData{
    
    var array = [VueData]()
    
}

