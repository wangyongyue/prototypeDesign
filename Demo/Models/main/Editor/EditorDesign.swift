//
//  EditorDesign.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class EditorDesign:Vue,GetViewProtocol {
    var arrayContent = [VueData]()
    var arrayNav = [VueData]()
    var r = Record()
    var editorView:EditorView?
    func getView() -> ViewLoadProtocol {
        let v = EditorView.init(self)
        self.editorView = v
        return v
    }
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
//        App.instance.add(r)
      
    }
   
    private func dealNav(){
        
        let m = NavTitleCellModel()
        m.name = r.title
        
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
                        
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
           if number == 1{
            
                self.arrayContent.remove(at:index)
                self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                    return self.arrayContent
                }
                self.r.array = self.arrayContent
                return
               
           }
           if let r = self.r.record{
            
                let m = EditorDetails()
                m.r = r
                self.editorView?.changeModel(m)

               
           }else{
                Alert.editorContent("请输入标题"){ (str) in
                    
                     let m = EditorDetails()
                     self.r.record = m.r
                     m.r.title = str
                    self.editorView?.changeModel(m)
                                      
                                      
                }
              
            
           }
          
       }
        
    }
        
}
  

