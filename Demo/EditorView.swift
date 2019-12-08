//
//  EditorView.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

import VueSwift

class EditorView: UIView,ViewLoadProtocol{

    var m:Vue?
    var vues = [Vue]()
    private let navigation = CTable()
    private let table = CTable()
    convenience init(_ m:Vue) {
        self.init()
        
        self.m = m
        
        vues.append(m)
        self.backgroundColor = Configuration.instructions.backgroundColor()
        
        
        
        self.addSubview(navigation)
        navigation.backgroundColor = Configuration.instructions.navigtaionBackgroundColor()
        navigation.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(Adapter.topNavigation())
        }
        navigation.v_array(vId: NAVARRAYID, vue: m)
        navigation.v_index(vId: NAVINDEXID, vue: m)
        

        
        self.addSubview(table)
        table.backgroundColor = Configuration.instructions.backgroundColor()
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topNavigation())
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        
                
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    func viewLoad(){
        
        m?.v_start()
        
    }
    func changeModel(_ m:Vue){
        vues.append(m)
        
        self.m = m
        navigation.v_array(vId: NAVARRAYID, vue: m)
        navigation.v_index(vId: NAVINDEXID, vue: m)
        
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        m.v_if(vId: BACKXID) { (isF) in
            if isF{
                self.backModel()
            }
        }
        self.m?.v_start()
    }
    private func backModel(){
        if vues.count > 0{
            vues.removeLast()
        }
        if vues.count > 0{
            
            self.m = vues.last
            navigation.v_array(vId: NAVARRAYID, vue: vues.last)
            navigation.v_index(vId: NAVINDEXID, vue: vues.last)
            
            table.v_array(vId: ARRAYID, vue: vues.last)
            table.v_index(vId: INDEXID, vue: vues.last)
            vues.last?.v_if(vId: INDEXID) { (isF) in
                if isF{
                    self.backModel()
                }
            }
            self.m?.v_start()
        }
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
}
