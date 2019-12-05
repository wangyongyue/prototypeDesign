//
//  Editor.swift
//  Demo
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class Editor:Vue,V_ViewControllerProtocol{
    
   func v_viewController() -> UIViewController{
       let vc = EditorViewController()
       vc.m = self
       return vc
   }
   
    override func v_start() {
        dealTabBar()
        dealContent()
        dealMenu()
//        dealLeft()
        dealRight()

    }
    private func dealLeft(){

        var array = [VueData]()
        array.append(EditorLRCellModel("返回"))
        array.append(EditorLRCellModel("返回"))

        self.v_array(vId: LEFTARRAYID) { () -> Array<VueData>? in
            
            return array
        }

        self.v_index(vId: LEFTINDEXID) { (index) in
        
                     
         }
    }
    private func dealRight(){

        var array = [VueData]()
        array.append(EditorLRCellModel("预览"))
        array.append(EditorLRCellModel("预览"))

        self.v_array(vId: RIGHTARRAYID) { () -> Array<VueData>? in
            
            return array
        }

        self.v_index(vId: RIGHTINDEXID) { (index) in
        
                     
         }
    }
        
    private func dealTabBar(){
        var array = [VueData]()
        array.append(TabHMCellModel(.edit))
        
        self.v_array(vId: BARARRAYID) { () -> Array<VueData>? in
            
            return array
        }

        self.v_index(vId: BARINDEXID) { (index) in
        
                     
         }
                
    }
        
    private func dealContent(){
        
        var views = [GetViewProtocol]()
       
        
        var number = 2;
        if let data = App.instance.tabBar{
            if data is TabHMCellModel{
               number = 2
            }else if data is TabHMMCellModel{
               number = 3

            }else if data is TabHHMMCellModel{
               
               number = 4
            }else if data is TabHHSMMCellModel{
               
               number = 5
            }
        }
        
        if App.instance.array.count > 0{
            for index in 0...number - 1 {
                if App.instance.array.count - 1 >= index{
                    
                    let d = EditorDesign()
                    d.r = App.instance.array[index]
                    views.append(d)

                    
                }else{
                    
                    let d = EditorDesign()
                    d.r.title = "tab\(index + 1)"
                    views.append(d)

                }
              
            }
            
            App.instance.removeAll()

        }else{
            for index in 0...number - 1 {
                let d = EditorDesign()
                d.r.title = "tab\(index + 1)"
                views.append(d)

            }
            
        }
       
      

        var contentArray = [VueData]()
        for (index,value) in views.enumerated(){
            let m = TabContentCellModel()
            m.view = value.getView()
            if index == 0{
                m.view?.viewLoad()
                m.isL = true
                
            }
            contentArray.append(m)
        }
        
        self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
            
            return contentArray
            
        }
      
    }
    private func dealMenu(){
        
        var views = [GetViewProtocol]()
         
         let bar1 = SelectionBar1()
         let bar2 = SelectionBar2()
         let bar3 = SelectionBar3()
         views.append(bar1)
         views.append(bar2)
         views.append(bar3)
         
        
         bar1.choiceData { (data) in
             
         }
         bar2.choiceData { (data) in
            
         }
         bar3.choiceData { (data) in
             
         }
         

         var contentArray = [VueData]()
         for (index,value) in views.enumerated(){
             let m = TabContentCellModel()
             m.view = value.getView()
              m.view?.viewLoad()
              m.isL = true
             contentArray.append(m)
         }
         
         self.v_array(vId: BOTTOMARRAYID) { () -> Array<VueData>? in
             
             return contentArray
             
         }
         
//         self.v_index(vId: BOTTOMINDEXID) { (index) in
//
//             let v = contentArray[index] as! TabContentCellModel
//             if v.isL == false{
//                 v.view?.viewLoad()
//                 v.isL = true
//
//             }
//
//         }
        
        
        
    }


        
}

