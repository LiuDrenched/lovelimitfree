//
//  LFDownloader.swift
//  1604LimitFree
//
//  Created by 千锋 on 16/9/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

//下载的类型
public enum DownloadType: Int {
    
    case Default        //默认值
    case Detail         //详情数据
    case NearBy         //详情页的附近
    
}

protocol LFDownloaderDelegate:NSObjectProtocol {
    //下载失败
    func downloader(downloader: LFDownloader, didFailWithError error: NSError)
    //下载成功
    func downloader(downloader: LFDownloader, didfinishWithData data: NSData)
}

class LFDownloader: NSObject {
    
    //下载类型
    var type: DownloadType = .Default
    
    //代理属性
    weak var delegate: LFDownloaderDelegate?
    
    //下载方法
    func downloadWithURLString(urlString: String){
        //1.创建NSURL对象
        let url = NSURL(string: urlString)
        //2.创建NSURLRequest对象
        let request = NSURLRequest(URL: url!)
        //3.获取NSURLSession对象
        let session = NSURLSession.sharedSession()
        
        //4.创建NSURLSessionDataTask对象
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            if let tmpError = error {
                //下载失败
                self.delegate?.downloader(self
                    , didFailWithError: tmpError)
            }else{
                let httpResponse = response as! NSHTTPURLResponse
                if httpResponse.statusCode == 200{
                    //下载成功
                    self.delegate?.downloader(self, didfinishWithData: data!)
                    
                }else{
                    //下载失败
                    let err = NSError(domain: urlString, code: httpResponse.statusCode, userInfo: ["msg":"下载失败"])
                    self.delegate?.downloader(self
                        , didFailWithError: err)
                }
            }
        }
        
        //5.开启下载
        task.resume()
    }

}
