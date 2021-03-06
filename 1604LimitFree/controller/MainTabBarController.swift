//
//  MainTabBarController.swift
//  1604LimitFree
//
//  Created by 千锋 on 16/9/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //修改选中文字的颜色
        tabBar.tintColor = UIColor(red: 83.0/255.0, green: 156.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        //另外一种设置tabBar文字的颜色
        //appearance()是统一设置某些控件的显示特性
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.redColor()], forState: .Selected)
        
        //创建管理子视图控制器
        createViewControllers()
    }
    
    func createViewControllers(){
        
        //标题
        let titleArray = ["限免","降价","免费","专题","热榜"]
        //图片
        let imageArray = ["tabbar_limitfree","tabbar_reduceprice","tabbar_appfree","tabbar_subject","tabbar_rank"]
        //视图控制器
        let ctrlArray = ["_604LimitFree.LimitFreeViewController","_604LimitFree.ReduceViewController","_604LimitFree.FreeViewController","_604LimitFree.SubjectViewController","_604LimitFree.RankViewController"]
        
        var array = Array<UINavigationController>()
        for i in 0..<titleArray.count {
            
            //1)创建视图控制器
            let ctrlName = ctrlArray[i]
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = cls.init()
            
            //2)设置文字和图片
            ctrl.tabBarItem.title = titleArray[i]
            let imageName = imageArray[i]
            //图片
            ctrl.tabBarItem.image = UIImage(named: imageName)
            //选中图片
            //imageWithRenderingMode(.AlwaysOriginal)防渲染
            ctrl.tabBarItem.selectedImage = UIImage(named: (imageName+"_press"))?.imageWithRenderingMode(.AlwaysOriginal)
            //3)导航
            let navCtrl = UINavigationController(rootViewController: ctrl)
            array.append(navCtrl)
        }
        
        viewControllers = array
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
