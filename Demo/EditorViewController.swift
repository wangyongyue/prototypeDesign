//
//  EditorViewController.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift

class EditorViewController: UIViewController {

    var m:Vue?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Configuration.instructions.backgroundColor()

    
        let h = HEIGHT * bili
        let w = WIDTH * bili

        let style = UIView()
        style.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20)
        style.alpha = 1
        self.view.addSubview(style)
        style.backgroundColor = Configuration.instructions.statusColor()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: w, height: h - (BOTTOM))
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.view.addSubview(table)
        table.backgroundColor = UIColor.white
        table.isScrollEnabled = false
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topStatus())
            make.left.equalTo(0)
            make.width.equalTo(w)
            make.height.equalTo(h - (BOTTOM))

        }
        table.layer.borderColor = UIColor.lightGray.cgColor
        table.layer.borderWidth  = 0.3
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        m?.v_index(vId: MENUINDEXID, v: { (index) in
            
            table.setContentOffset(CGPoint.init(x: w * CGFloat(index), y: 0), animated: false)
        })
       
      
        let bottomTable = CTable()
        self.view.addSubview(bottomTable)
        bottomTable.backgroundColor = Configuration.instructions.backgroundColor()
        bottomTable.snp.makeConstraints { (make) in
            
            make.height.equalTo(50)
            make.left.equalTo(0)
            make.width.equalTo(w)
            make.top.equalTo(table.snp_bottomMargin).offset(0)
            
        }
        bottomTable.v_array(vId: BARARRAYID, vue: m)
        bottomTable.v_index(vId: BARINDEXID, vue: m)
        bottomTable.isScrollEnabled = false
        bottomTable.layer.borderColor = UIColor.lightGray.cgColor
        bottomTable.layer.borderWidth  = 0.3
                

        let rightTable = CTable()
        self.view.addSubview(rightTable)
        rightTable.backgroundColor = Configuration.instructions.backgroundColor()
        rightTable.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topStatus())
            make.left.equalTo(table.snp_rightMargin).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(table)
            
        }
        rightTable.v_array(vId: RIGHTARRAYID, vue: m)
        rightTable.v_index(vId: RIGHTINDEXID, vue: m)
        
        
        let menyLayout = UICollectionViewFlowLayout()
        menyLayout.itemSize = CGSize.init(width: Adapter.width()/2, height: Adapter.heigt() - h)
        menyLayout.scrollDirection = .horizontal
        menyLayout.minimumLineSpacing = 20
        menyLayout.minimumInteritemSpacing = 0
        let menuTable = CCollection.init(frame: CGRect.zero, collectionViewLayout: menyLayout)
        self.view.addSubview(menuTable)
        menuTable.backgroundColor = UIColor.white
        menuTable.snp.makeConstraints { (make) in
            
             make.bottom.equalTo(0)
             make.right.equalTo(0)
             make.left.equalTo(0)
             make.top.equalTo(bottomTable.snp_bottomMargin).offset(10)
        }
        menuTable.layer.borderColor = UIColor.lightGray.cgColor
        menuTable.layer.borderWidth  = 0.3
        menuTable.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)

        
        menuTable.v_array(vId: BOTTOMARRAYID, vue: m)
        menuTable.v_index(vId: BOTTOMINDEXID, vue: m)
        
        let upButton = UIButton()
        upButton.setImage(UIImage.init(named: "r_6"), for: .normal)
        upButton.setImage(UIImage.init(named: "r_7"), for: .selected)
        self.view.addSubview(upButton)
        upButton.frame = CGRect.init(x: Adapter.width() - 70, y: h + Adapter.topStatus() - 40, width: 60, height: 60)

        upButton.v_click {
            
            upButton.isSelected = !upButton.isSelected
            let uh:CGFloat = 300.0
            if upButton.isSelected{
                
                menuTable.frame = CGRect.init(x: 0, y: uh, width: Adapter.width(), height: Adapter.heigt() - uh)
                
                upButton.frame = CGRect.init(x: Adapter.width() - 70, y: uh - 40, width: 60, height: 60)

                menyLayout.itemSize = CGSize.init(width: Adapter.width()/2, height: Adapter.heigt() - uh)

                
            }else{
                upButton.frame = CGRect.init(x: Adapter.width() - 70, y: h + Adapter.topStatus() - 40, width: 60, height: 60)

                menuTable.frame = CGRect.init(x: 0, y: h + Adapter.topStatus() + 5, width: Adapter.width(), height: Adapter.heigt() - h - Adapter.topStatus() - 5)

                menyLayout.itemSize = CGSize.init(width: Adapter.width()/2, height: Adapter.heigt() - h)

            }
            
        }
       
        m?.v_if(vId: STATUSID, v: { (isF) in
            if isF{
                
                style.backgroundColor = Configuration.instructions.themeColor()

            }
        })
        m?.v_if(vId: RELOADDataID, v: { (isF) in
            if isF{
                
                table.reloadData()

            }
        })
        
        m?.v_start()
        
        
        
        
    }
    

}
