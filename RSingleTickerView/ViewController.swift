//
//  ViewController.swift
//  RSingleTickerView
//
//  Created by Claude Chey on 2015. 9. 23..
//  Copyright © 2015년 Claude Chey. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    var tickerView:RSingleTickerView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        createTickerView()
        createButtons()
    }

    func createTickerView()
    {
        let winBounds = UIScreen.mainScreen().bounds;
        
        tickerView = RSingleTickerView(frame: CGRectMake(winBounds.size.width/4, winBounds.size.height/3, winBounds.size.width/4 * 2, 30));
        tickerView.backgroundColor = UIColor.blackColor()
        tickerView.text = "RSingleTickerView"
        tickerView.textColor = UIColor.grayColor()
        tickerView.font = UIFont.systemFontOfSize(24)
        tickerView.intervalMilliseconds = 0.02
        tickerView.intervalGap = 1.0
        tickerView.forceAnimate = false
        tickerView.leftMargin = 10
        self.view.addSubview(tickerView);
        
        tickerView.startWithDelay(DelaySeconds: 3)
    }
    
    
    func createButtons()
    {
        let winBounds = UIScreen.mainScreen().bounds;
        
        let startBtn: UIButton = UIButton(type: UIButtonType.Custom)
        startBtn.setTitle("start", forState: UIControlState.Normal)
        startBtn.addTarget(self, action: Selector("touchedStartBtn:"), forControlEvents: UIControlEvents.TouchUpInside)
        startBtn.frame = CGRectMake(0, winBounds.size.height/4 * 3, 150, 50)
        startBtn.backgroundColor = UIColor.redColor()
        self.view.addSubview(startBtn)
        
        let stopResetBtn: UIButton = UIButton(type: UIButtonType.Custom)
        stopResetBtn.setTitle("stop with reset", forState: UIControlState.Normal)
        stopResetBtn.addTarget(self, action: Selector("touchedStopWithResetBtn:"), forControlEvents: UIControlEvents.TouchUpInside)
        stopResetBtn.frame = CGRectMake(winBounds.size.width - 150, winBounds.size.height/4 * 3, 150, 50)
        stopResetBtn.backgroundColor = UIColor.redColor()
        self.view.addSubview(stopResetBtn)
    }
    
    
    func touchedStartBtn(button:UIButton)
    {
        tickerView.start()
    }
    
    func touchedStopWithResetBtn(button:UIButton)
    {
        tickerView.stopWithReset()
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

