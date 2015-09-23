//
//  RSingleTickerView.swift
//  RSTickrView
//
//  Created by Claude Chey on 2015. 9. 23..
//  Copyright © 2015년 Claude Chey. All rights reserved.
//

import Foundation
import UIKit


class RSingleTickerView: UIView
{
    private var mTimerDelay:NSTimer?
    private var mTimer:NSTimer?
    private var mLabel:UILabel?
    private var mMoveInterval:Float = 0.05
    private var mLeftMargin:Float = 0
    private var mForceAnimate:Bool = false; // true: animating for (text width < view width )
    
    var intervalGap:Float = 1.0
    
    var intervalMilliseconds:Float {
        get {
            return mMoveInterval
        }
        set (interval) {
            assert( interval > 0 )
            mMoveInterval = interval
            
            if mTimer != nil
            {
                stop()
                start()
            }
        }
    }
    
    var forceAnimate:Bool {
        get {
            return mForceAnimate
        }
        set (animate) {
            mForceAnimate = animate
            if mTimerDelay == nil && mTimer != nil
            {
                stop()
                start()
            }
        }
    }
    
    var leftMargin:Float {
        get {
            return mLeftMargin
        }
        set (margin) {
            mLeftMargin = margin
            if mTimer == nil
            {
                mLabel?.leftX += CGFloat(mLeftMargin)
            }
        }
    }
    
    
    var text:String? {
        get {
            return mLabel?.text
        }
        set (text) {
            mLabel?.text = text
            mLabel?.sizeToFit()
        }
    }
    
    var textColor:UIColor? {
        get {
            return mLabel?.textColor
        }
        set (color) {
            mLabel?.textColor = color
        }
    }
    
    var font:UIFont? {
        get {
            return mLabel?.font
        }
        set (font) {
            mLabel?.font = font
            mLabel?.sizeToFit()
        }
    }


    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        layer.masksToBounds = true
        initWithLabel()
    }

    
    
    
    func initWithLabel()
    {
        mLabel = UILabel()
        mLabel?.textColor = UIColor.blackColor()
        mLabel?.font = UIFont.systemFontOfSize(12)
        mLabel?.sizeThatFits(frame.size)
        addSubview(mLabel!)
    }
    
    func reset()
    {
        mLabel?.leftX = CGFloat(mLeftMargin) + 0
    }
    
    func textSize(text:String, font:UIFont)->CGSize
    {
        return (text as NSString).sizeWithAttributes([NSFontAttributeName:font])
    }
    
    
    
    
    func startWithDelay(DelaySeconds delay:Float)
    {
        if mTimerDelay == nil && mTimer == nil
        {
            mTimerDelay = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("start"), userInfo: nil, repeats: false)
        }
    }
    
    func start()
    {
        if mTimerDelay != nil
        {
            mTimerDelay?.invalidate()
            mTimerDelay = nil
        }
        
        if mForceAnimate == false && mLabel?.width < width
        {
            return
        }
        
        if mTimer == nil
        {
            mTimer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(mMoveInterval), target: self, selector: Selector("tick:"), userInfo: nil, repeats: true)
        }
    }
    
    func stopWithReset()
    {
        stop()
        reset();
    }
    
    func stop()
    {
        mTimer?.invalidate()
        mTimer = nil
    }
    
    
    func tick(timer:NSTimer)
    {
        mLabel?.leftX -= CGFloat(intervalGap)
        if mLabel?.rightX < 0
        {
            mLabel?.leftX = CGFloat(mLeftMargin) + width
        }
    }

}





extension UIView
{
    var leftX:CGFloat {
        get {
            return frame.origin.x
        }
        set (value) {
            var frm = frame
            frm.origin.x = value
            frame = frm
        }
    }
    
    var rightX:CGFloat {
        return frame.origin.x + frame.size.width
    }

    var width:CGFloat {
        return frame.size.width
    }
    
    var height:CGFloat {
        return frame.size.height
    }
}








