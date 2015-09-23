# RSingleTickerView
=========

RSingleTickerView is TickerView for Swift
Sample movie : https://youtu.be/fNjUK7iolxM

##Simple Usage##

    tickerView = RSingleTickerView(frame: "frame");
    tickerView.text = "RSingleTickerView"
    tickerView.textColor = UIColor.grayColor()
    tickerView.font = UIFont.systemFontOfSize(24)
    self.view.addSubview(tickerView);
    tickerView.startWithDelay(DelaySeconds: 3)


##Methods##
    
    startWithDelay(DelaySeconds:Float)
    start()
    stopWithReset()
    stop()
    reset() // position reset

##Properties##

    intervalGap:Float // position gap for interval animation 
    intervalMilliseconds:Float
    forceAnimate:Bool // true: animating for (text width < view width )
    leftMargin:Float // left margin for text label
    text:String
    textColor:UIColor
    font:UIFont
