//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by NUK on 16/8/16.
//  Copyright © 2016年 NUK. All rights reserved.
//

import UIKit
import Alamofire

public enum KTCDownloaderType:Int{
    case Default = 10
    
    case Recommend              //食材首页的推荐
    case FoodMaterial           //食材
    case Category               //首页的分类
    case FoodCourse             //食材课程
    case FoodCourseComment      //食材课程的评论
    
    
    
}


protocol KTCDownloaderDelegate:NSObjectProtocol {
    //下载失败
    func downloader(downloader:KTCDownloader,didFailWithError error:NSError)
    //下载成功
    func downloader(downloader:KTCDownloader,didFinishWithData data:NSData?)
}
class KTCDownloader: NSObject {

    //代理属性
    //一定要用weak修饰
    weak var delegate:KTCDownloaderDelegate?
    //类型,用来区分不同下载
    var type:KTCDownloaderType = .Default
    //Post请求下载数据的方法
    func postWithUrl(urlString:String,params:Dictionary<String,String>?){
        //"token":"","user_id":"","version":"4.5"
        var newParam = params
        newParam!["token"] = ""
        newParam!["user_id"] = ""
        newParam!["version"] = "4.5"
        
        Alamofire.request(.POST, urlString, parameters: newParam, encoding: ParameterEncoding.URL, headers: nil).responseData {
            (response) in
            switch response.result{
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
        
    }
    
}
