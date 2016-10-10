//
//  LimitCell.swift
//  1604LimitFree
//
//  Created by 千锋 on 16/9/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class LimitCell: UITableViewCell {
    
    @IBOutlet weak var BgImageView: UIImageView!
    
    @IBOutlet weak var AppImageView: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var LastPriceLabel: UILabel!
    
    @IBOutlet weak var MyStarView: StarView!
    
    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBOutlet weak var ShareLabel: UILabel!
    
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBOutlet weak var DownloadLabel: UILabel!
    
    //价格的横线
    private var lineView: UIView?
    
    
    //显示数据
    func config(model: LimitModel, atIndex index:Int) {
        
        //1.背景图片
        if index % 2 == 0{
            BgImageView.image = UIImage(named: "cate_list_bg1")
        }else{
            BgImageView.image = UIImage(named: "cate_list_bg2")
        }
        
        //2.应用的图片
        let url = NSURL(string: model.iconUrl!)
        AppImageView.kf_setImageWithURL(url!)
        
        //3.名字
        NameLabel.text = "\(index)."+model.name!
        
        //4.日期
        let index = model.expireDatetime?.endIndex.advancedBy(-2)
        let expireDateStr = model.expireDatetime?.substringToIndex(index!)
        
        //字符串转对象
        let df = NSDateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let expireDate = df.dateFromString(expireDateStr!)
        
        //日历对象
        let cal = NSCalendar.currentCalendar()
        
        //时,分,秒
        let unit = NSCalendarUnit(rawValue: NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue | NSCalendarUnit.Second.rawValue)
        /*
         计算两个日期时间的时间差
         第一个参数：需要的时间差包含的单元(年/月/日/时/分/秒)
         第二个参数：开始时间
         第三个参数：结束时间
         第四个参数：选项(0)
         */
        
        let dateComps = cal.components(unit, fromDate: NSDate(), toDate: expireDate!, options: NSCalendarOptions.MatchStrictly)
        
        TimeLabel.text = String(format: "剩余:%02ld:%02ld:%02ld",dateComps.hour, dateComps.minute, dateComps.second)
        
        //5.原价
        let priceStr = "￥:"+model.lastPrice!
        LastPriceLabel.text = priceStr
        
        //横线
        if lineView == nil{
            lineView = UIView(frame: CGRectMake(0,10,60,1))
            lineView!.backgroundColor = UIColor.blackColor()
            LastPriceLabel!.addSubview(lineView!)
        }
        
        //6.星级
        MyStarView.setRating(model.starCurrent!)
        
        //7.类型
        //中文版
        CategoryLabel.text = MyUtil.transferCateName(model.categoryName!)
        //英文版
        //CategoryLabel.text = model.categoryName
        
        //8.分享，收藏，下载
        ShareLabel.text = "分享:" + model.shares! + "次"
        FavoriteLabel.text = "收藏" + model.favorites! + "次"
        DownloadLabel.text = "下载" + model.downloads! + "次"
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
