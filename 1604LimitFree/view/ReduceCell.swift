//
//  LimitCell.swift
//  1604LimitFree
//
//  Created by 千锋 on 16/9/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class ReduceCell: UITableViewCell {
    
    @IBOutlet weak var BgImageView: UIImageView!
    @IBOutlet weak var AppImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var LastPriceLabel: UILabel!
    @IBOutlet weak var MyStarView: StarView!
    
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var ShareLabel: UILabel!
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBOutlet weak var DownloadLabel: UILabel!
    
    
    
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
        
        //4.现价
        priceLabel.text = "现价:"+(model.currentPrice!)
        
        
        //5.原价
        let priceStr = "$:"+model.lastPrice!
        LastPriceLabel.text = priceStr
        
        /*
         第一个参数：显示的字符串
         第二个参数：字符串的样式
         NSStrikethroughStyleAttributeName->中划线
         */
        /*
         let attrStr = NSAttributedString(string: priceStr, attributes: [NSStrikethroughStyleAttributeName:(int: 1),NSStrikethroughColorAttributeName:UIColor.redColor()])
         */
        let attrStr = NSAttributedString(string: priceStr, attributes: [NSStrikethroughStyleAttributeName:(int: 1)])
        LastPriceLabel.attributedText = attrStr
            
        
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
