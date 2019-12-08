//
//  Main.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Main:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
        dealStatus()
        dealNav()
        dealContent()
        
    }
    private func dealStatus(){
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            
            return false
        }
        
    }
    private func dealNav(){
        
        let m = NavTitleCellModel()
        m.name = "原型设计"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            
        }
        
    }
    private func dealContent(){

        self.arrayContent.append(HeadCellModel())
        
//        self.arrayContent += App.instance.analysisAppTitles()
       
        self.arrayContent.append(MainCellModel.init(App.instance.analysisAppTitles()))

       self.arrayContent.append(AddCellModel())

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
           let data = self.arrayContent[index] as! VueData
           let number = data.v_identifier
           let mainModel = self.arrayContent[1] as! MainCellModel

           if data is AddCellModel{
               if let count = mainModel.array?.count{
                
                    if count >= 5{
                        return Alert.show(str: "最多只能创建五个项目原型")

                    }
                
                }
                
                Alert.editorContent("请输入项目原型简介"){ (str) in
                    
                    if let arrayContent = mainModel.array{
                        
                        for value in arrayContent{
                            if value is MainSubCellModel{
                                let m = value as! MainSubCellModel
                                if let n = m.name{
                                    if n == str{
                                        return Alert.show(str: "项目名称不能相同")

                                    }
                                }
                            }
                        }
                        
                        let a = MainSubCellModel()
                        a.name = str
                        mainModel.array?.append(a)

                        self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                            return self.arrayContent
                        }

                        self.mainCacheAppTitles()
                        
                    }
                    
                }
            
           }else if data is MainCellModel{
                 if number >= deleTag{
                    mainModel.array?.remove(at: number - deleTag)
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    self.mainCacheAppTitles()

                 }else{
                    let m = mainModel.array?[number] as! MainSubCellModel
                    if let bar = m.data{

                        App.instance.tabBar = bar
                        App.instance.name = m.name
                        App.instance.analysisCache()
//                        UIViewController.toHome()
                        UIViewController.toEditor()

//                        Alert.defaultImageStyle {
//                            
//
//                        }


                                               
                    }else{
                        

                        TabSelectionBar().show { (bar) in
                            
                            App.instance.tabBar = bar
                            App.instance.name = m.name
                            App.instance.analysisCache()
                            UIViewController.toEditor()

//                            Alert.defaultImageStyle {
//                                
//
//                            }

                            
                        }
                        
                    }
                    
                 }
               
           }
          
       }
        
         
        
    }
    private func mainCacheAppTitles(){
        
        var titles = [String]()
        let mainModel = self.arrayContent[1] as! MainCellModel
        if let array = mainModel.array{
            for value in array{
                if value is MainSubCellModel{
                    let m = value as! MainSubCellModel
                    if let n = m.name{
                        titles.append(n)
                    }
                }
            }
        }
        
        App.instance.cacheAppTitles(titles)

    }
  
   
   
    
}
