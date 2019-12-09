//
//  Configuration.swift
//  Demo
//
//  Created by apple on 2019/7/5.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

let TOP:CGFloat = 64
let BOTTOM:CGFloat = 40
//let WIDTH:CGFloat = UIScreen.main.bounds.width
//let HEIGHT:CGFloat = UIScreen.main.bounds.height
//        - width : 375.0
//        - height : 667.0
let WIDTH:CGFloat = 375
let HEIGHT:CGFloat = 667

let HEIGHTPAD:CGFloat = 667
let WIDTHPAD:CGFloat = 375


//主体颜色
let  themeColor = UIColor.init(red: 9/255.0, green: 169/255.0, blue: 159/255.0, alpha: 1.0)
let  bgColor = UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)

//状态
enum SomponentStatus {
    case select
    case edit
}

class Configuration{
    
    var imageDefault = false //false true //为true显示默认图片
    var previewDefault = false //

    static let instructions = KnowledgeInstructions()
    static func isHidden(_ view:UIView,_ a:SomponentStatus){
        
        
        if a == .edit{
            view.isHidden = false
            
        }else{
            view.isHidden = true
        }
        if Configuration.instructions.previewDefault{
            view.isHidden = true
        }
       
    }
    static func getCellHeight(_ a:SomponentStatus,_ h1:CGFloat,_ h2:CGFloat,_ h3:CGFloat) -> CGFloat{
        if Configuration.instructions.previewDefault{
            return h1
        }
        if a == .edit{
            return h2
        }
        if Adapter.isPad(){
            return h2

        }
        return h3
    }
    static func getHeight(_ a:SomponentStatus,_ h1:CGFloat,_ h2:CGFloat,_ h3:CGFloat) -> CGFloat{
        if Configuration.instructions.previewDefault{
            return h1
        }
        if a == .select{
            return h2
        }
        return h3
    }
    static func getFont() -> UIFont{
        if Adapter.isPad(){
            return UIFont.systemFont(ofSize: 15)

        }

        return UIFont.systemFont(ofSize: 13)
    }
    static func getData() -> String{
        
        return "Data"
    }
    
    func getTabBar() -> UIViewController{
        let tab = BaseTabBarController()
        tab.addChildVC(childVC: Home().v_viewController(), childTitle: "主页", image: Image.home(), selectedImage: Image.home_sel())
        return tab
    }
    func themeColor() -> UIColor{
        return UIColor.init(red: 9/255.0, green: 169/255.0, blue: 159/255.0, alpha: 1.0)
    }
    func backgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func tabBarBackgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func tabBarColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func navigtaionBackgroundColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func statusColor() -> UIColor{
        return UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
    func navigtaionTextColor() -> UIColor{
          return UIColor.black
    }
    
}
extension UIViewController{
    
   
    static func toHome(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let tab = Configuration.instructions.getTabBar()
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
        
//        let tab = BaseNavigationController.init(rootViewController: Menu().v_viewController())

    
    }
    
    static func toLogin(){
            let app = UIApplication.shared.delegate as! AppDelegate
            let tab = BaseNavigationController.init(rootViewController: Login().v_viewController())
            app.window?.rootViewController = tab;
            app.window?.makeKeyAndVisible();
            

        
        }
    static func toMain(){
        App.instance.cache()
        App.instance.removeAll()
        let app = UIApplication.shared.delegate as! AppDelegate
        let tab = BaseNavigationController.init(rootViewController: Main().v_viewController())
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
               
    }
    
    static func toEditor(){
       
        let app = UIApplication.shared.delegate as! AppDelegate
        let tab = Editor().v_viewController()
        app.window?.rootViewController = tab;
        app.window?.makeKeyAndVisible();
               
    }
}
