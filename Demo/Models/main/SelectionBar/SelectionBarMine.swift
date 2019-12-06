//
//  SelectionBarMine.swift
//  Demo
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class SelectionBarMine:Vue,GetViewProtocol{
    
    private var block:VDataBlock?
    func choiceData(_ ablock:@escaping VDataBlock){
        
        self.block = ablock

    }
    func getView() -> ViewLoadProtocol {
        let v = TableView.init(self)
        return v
    }
    
    override func v_start() {
                
        dealContent()
      
    }
   
    private func dealContent(){
        
       var array = [VueData]()
       
       
        array.append(MineCellModel(.select))
       array.append(MineTabCellModel(.select))
       array.append(MineSetupCellModel(.select))


       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
         self.v_index(vId: INDEXID) { (index) in
             
            let a = array[index] as! BaseData
            a.status = .edit
            self.block?(a)

        }
        
    }
    
    
    
}
