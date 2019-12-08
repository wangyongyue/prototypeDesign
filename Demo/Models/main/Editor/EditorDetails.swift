//
//  EditorDetails.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class EditorDetails:Vue{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var r = Record()
    
    
    func reloadData(_ a:VueData){
        
        r.array?.removeLast()
        r.array?.append(a)
        r.array?.append(GuideCellModel())
        
        dealContent()

    }
    override func v_start() {
        dealNav()
        dealContent()
      
        r.array = self.arrayContent
    }
    
    private func dealNav(){
        
        let m = NavBackCellModel()
        m.name = r.title
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            self.v_if(vId: BACKXID) { () -> Bool? in
                return true
            }
            
        }
        
    }
    private func dealContent(){
        
        
        if let array = self.r.array{
         
         if array.count > 0{
             self.arrayContent = array
             if let a = array.last{
                 if a is GuideCellModel{
                 }else{
                     self.arrayContent.append(GuideCellModel())

                 }
             }
             
         }else{
            
             self.arrayContent.append(GuideCellModel())
         }
         
        }else{
        
            self.arrayContent.append(GuideCellModel())
         
        }
      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
           
        
            let data = self.arrayContent[index] as! VueData
            let number = data.v_identifier
            if data is AddCellModel{
                
                let bar = SelectionTabBar()
                bar.show { (data) in
                    
                    self.arrayContent[index] = data
                    self.arrayContent.append(AddCellModel())

                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                               
                    }
                    self.r.array = self.arrayContent

                }
                
            }else{
                if number == 1{
                 
                     self.arrayContent.remove(at:index)
                     self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                         return self.arrayContent
                                
                     }
                     self.r.array = self.arrayContent
                     return
                    
                }
                if let r = self.r.record{
                 
                     let m = Details()
                     m.r = r
                     Router.push(m, nil, nil)
                    
                }else{
                    Alert.editorContent("请输入标题"){ (str) in

                         let m = Details()
                         self.r.record = m.r
                         m.r.title = str
                         Router.push(m, nil, nil)
                                          
                                          
                    }
                 
                }
                
            }
          
       }
        
         
        
    }
  
   
   
    
}

