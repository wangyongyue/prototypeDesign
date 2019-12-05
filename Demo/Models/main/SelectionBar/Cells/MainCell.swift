
//
//  MainCell.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MainCell: UITableViewCell {
    
    lazy private var m:Vue = {
        let a = Vue()
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
                
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: WIDTH/3, height: WIDTH/3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.addSubview(table)
        table.backgroundColor = UIColor.clear
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        
        self.contentView.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MainCellModel{
            
            let m = aModel as! MainCellModel
            if let array = m.array{
                self.m.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                    return array
                }
            }
          
            self.m.v_index(vId: INDEXID) { (index) in
                let subM = m.array?[index] as! MainSubCellModel
                if subM.v_identifier == 1{
                    
                    m.v_identifier = deleTag + index

                    
                }else{
                        
                    m.v_identifier = index

                }
                                   
                m.v_to()
            }
//
//            tap.v_tap {
//                m.v_identifier = 0
//                m.v_to()
//            }
        }
    }
}
class MainCellModel:VueData{
    
    var name:String?
    var array:Array<VueData>?
    convenience init(_ arr:Array<VueData>){
        self.init()
        self.array = arr
    }
    override func v_height() -> CGFloat {
        
        return HEIGHT - 300
    }
}


