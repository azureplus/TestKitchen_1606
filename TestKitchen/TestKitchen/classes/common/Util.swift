//
//  Util.swift
//  TestKitchen
//
//  Created by NUK on 16/8/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import UIKit
//这个文件用来定义枚举和其他类型
//1.食材首页推荐的数据类型
public enum WidgetType:Int{
    case GuessYourLike = 1      // 猜你喜欢
    case RedPackage = 2         // 红包入口
    case NewProduct = 5         // 今日新品
    case Special = 3            //早餐日记,健康100岁
    case Scene = 9              //全部场景
    case Talent = 4             //推荐达人
    case Works = 8              //精选作品
    case Subject = 7            //专题
    
}

//2.食材首页推荐的cell的点击事件闭的类型
/*
 第一个参数:标题文字
 第二个参数:link字符串
 */
public typealias CBCellClosure = (String?,String)->Void













