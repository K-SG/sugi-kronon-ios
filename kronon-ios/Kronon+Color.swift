//
//  Kronon+Color.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/27.
//

import Foundation
import UIKit

class SoreppoiAppColor {
    // 白を返す
    class var tabBackground: UIColor {
        return rgbColor(rgbValue: 0xFFFFFF)
    }

    // 薄いオレンジを返す
    class var tabIcon: UIColor{
        return rgbColor(rgbValue: 0xDE9B50)
    }

    // 白っぽい灰色を返す
    class var navigationBackground: UIColor{
        return rgbColor(rgbValue: 0xFAF9F9)
    }

    // #FFFFFFのように色を指定できるようにするメソッド！色が使いやすくなる。
    // ここでしか使わないので privateメソッドにする。
    private class func rgbColor(rgbValue: UInt) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
