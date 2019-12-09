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
    var currentEditor:EditorView?
    var views = [GetViewProtocol]()

   func v_viewController() -> UIViewController{
    
       if Adapter.isPad(){
             
            let vc = EditorPadViewController()
            vc.m = self
            return vc
       }
      
    
       let vc = EditorViewController()
       vc.m = self
       return vc
   }
   
    override func v_start() {
        dealContent()
        dealMenu()
        dealRight()
        dealTabBar()
        
        if let de = views.first as? EditorDesign{
            self.currentEditor = de.editorView
        }
    }
    
    private func dealRight(){

        var array = [VueData]()
        array.append(EditorLRCellModel("项目主页","r_1"))
        array.append(EditorLRCellModel("保存原型","r_3"))
//        array.append(EditorLRCellModel("预览原型","r_2"))

//        array.append(EditorLRCellModel("查看子项","r_4"))
//        array.append(EditorLRCellModel("左右模式","r_5"))
//        array.append(EditorLRCellModel("上移组件","r_6"))

        self.v_array(vId: RIGHTARRAYID) { () -> Array<VueData>? in
            
            return array
        }

        self.v_index(vId: RIGHTINDEXID) { (index) in
            
            if index == 0{
                
                UIViewController.toMain()
                
            }else if index == 2{
                App.instance.cache()
                Configuration.instructions.previewDefault = true
                UIViewController.toHome()
                
            }else if index == 1{
                App.instance.cache()
                Alert.show(str: "保存完成")
                
            }else if index == 3{
            
            }else if index == 4{
                
            }
        
                     
         }
    }
        
    private func dealTabBar(){
        
        
        var array = [VueData]()
        if let data = App.instance.tabBar{
            if data is BaseData{
                let m = data as! BaseData
                m.status = .select
                array.append(m)
            }
        }
        self.v_array(vId: BARARRAYID) { () -> Array<VueData>? in
            
            return array
        }

        self.v_index(vId: BARINDEXID) { (index) in
        
            let data = array[index] as! VueData
            let number = data.v_identifier
            if let de = self.views[number] as? EditorDesign{
                self.currentEditor = de.editorView
            }
            self.v_index(vId: MENUINDEXID, index: number)
         }
                
    }
        
    private func dealContent(){
        
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
                    App.instance.array.append(d.r)

                }
              
            }
            
//            App.instance.removeAll()

        }else{
            for index in 0...number - 1 {
                let d = EditorDesign()
                d.r.title = "tab\(index + 1)"
                views.append(d)
                App.instance.array.append(d.r)
            }
        }

        
        var contentArray = [VueData]()
        for (index,value) in views.enumerated(){
            let m = TabContentCellModel()
            m.view = value.getView()
            m.view?.viewLoad()
            contentArray.append(m)
        }
        
        self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
            
            return contentArray
            
        }
      
    }
    private func addData(_ data:VueData){
        if let m = self.currentEditor?.m{
            if m is EditorDesign{
                let em = m as! EditorDesign
                em.reloadData(data)
            }else if m is EditorDetails{
                let em = m as! EditorDetails
                em.reloadData(data)
            }
        }
    }
    private func dealMenu(){
        
        
        
        let m1 = TabTableCellModel()
        m1.array.append(BannerCellModel(.select))
        m1.array.append(Content101CellModel(.select))
        m1.array.append(Content102CellModel(.select))
        m1.array.append(Content103CellModel(.select))
        m1.array.append(Content104CellModel(.select))
        m1.array.append(Content105CellModel(.select))
        m1.array.append(Content106CellModel(.select))
        
        let m2 = TabTableCellModel()
        m2.array.append(Content201CellModel(.select))
        m2.array.append(Content202CellModel(.select))
        m2.array.append(Content203CellModel(.select))
        m2.array.append(Content204CellModel(.select))
        m2.array.append(Content205CellModel(.select))
        m2.array.append(Content206CellModel(.select))
        
        let m3 = TabTableCellModel()
        m3.array.append(Content301CellModel(.select))
        m3.array.append(Content302CellModel(.select))
        m3.array.append(Content303CellModel(.select))
        
        let m4 = TabTableCellModel()
        m4.array.append(MineCellModel(.select))
        m4.array.append(MineTabCellModel(.select))
        m4.array.append(MineSetupCellModel(.select))
        
        var contentArray = [VueData]()
        contentArray.append(m1)
        contentArray.append(m2)
        contentArray.append(m3)
        contentArray.append(m4)
        self.v_array(vId: BOTTOMARRAYID) { () -> Array<VueData>? in
            
            return contentArray
            
        }
        self.v_index(vId: BOTTOMINDEXID) { (index) in
        
            let content = contentArray[index] as! TabTableCellModel
            let number = content.v_identifier
            let a = content.array[number]
            if let classType = a.classForCoder as? VueData.Type {
                self.addData(classType.init())
            }
            
        }
        
    }
        
}

