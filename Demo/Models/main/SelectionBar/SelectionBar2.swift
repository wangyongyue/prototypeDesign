//
//  SelectionBar2.swift
//  Demo
//
//  Created by apple on 2019/11/27.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class SelectionBar2:Vue,GetViewProtocol{
    
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
           
//        array.append(Content106CellModel())
//        array.append(Content101CellModel())
//        array.append(Content102CellModel())
//        array.append(Content104CellModel())
//
//        array.append(Content301CellModel())
//        array.append(Content302CellModel())
//        array.append(Content303CellModel())
//
//
//        array.append(Content206CellModel())
//        array.append(Content103CellModel())
        
        
        
        array.append(Content201CellModel(.select))
        array.append(Content202CellModel(.select))
        array.append(Content203CellModel(.select))
        array.append(Content204CellModel(.select))
        array.append(Content205CellModel(.select))
        array.append(Content206CellModel(.select))

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
         self.v_index(vId: INDEXID) { (index) in
             
            let a = array[index]
            if let classType = a.classForCoder as? VueData.Type {
                self.block?(classType.init())
            }

        }
        
    }
    
    
    
}
