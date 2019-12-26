//
//  BAKit_UIButtonCountdown.swift
//  yunLianApp
//
//  Created by boai on 2018/1/15.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

@objc public protocol BAKit_UIButtonCountdownDelegate: NSObjectProtocol {
    // called when seconds update
    @objc optional func countdownButton(countdownButton: BAKit_UIButtonCountdown, didUpdatedWith seconds: Int)
    
    // called when the Countdown begin
    @objc optional func countdownButtonDidBeganCounting(countdownButton: BAKit_UIButtonCountdown)
    
    // called when the Countdown to the end
    @objc optional func countdownButtonDidEndCounting(countdownButton: BAKit_UIButtonCountdown)
}

open class BAKit_UIButtonCountdown: UIButton {
    @IBInspectable open var maxCountingSeconds: Int = 10
    @IBInspectable open var bgColorForEnable: UIColor?
    @IBInspectable open var bgColorForDisable: UIColor?
    @IBInspectable open var borderColorForEnable: UIColor?
    @IBInspectable open var borderColorForDisable: UIColor?
    @IBInspectable open var titleColorForEnable: UIColor?
    @IBInspectable open var titleColorForDisable: UIColor?
    @IBInspectable open var titleColorForCountingDisable: UIColor?
    
    public var timer: Timer?
    open weak var delegate: BAKit_UIButtonCountdownDelegate?
    public var isCounting: Bool = false //是否正在倒计时
    
    public var remainingSeconds: Int = 0 {
        willSet {
            self.isCounting = true
            self.delegate?.countdownButton?(countdownButton: self, didUpdatedWith: newValue)
            if newValue <= 0 {
                self.setTitle("重新发送", for: UIControl.State())
                self.stop()
                self.isEnabled = true
            } else {
                self.setTitle("\(newValue) s", for: UIControl.State())
            }
        }
    }
    
    public func start() {
        self.remainingSeconds = self.maxCountingSeconds
        weak var weakSelf = self
        if #available(iOS 10.0, *) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                weakSelf?.updateTime()
            })
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        
        self.delegate?.countdownButtonDidBeganCounting?(countdownButton: self)
        self.isEnabled = false
    }
    
    public func showSending() {
        self.setTitle("发送中..", for: .normal)
    }
    
    public func showFetchAgain() {
        self.setTitle("重新获取", for: .normal)
    }
    
    public func stop() {
        self.timer?.invalidate()
        self.timer = nil
        self.isCounting = false
        self.delegate?.countdownButtonDidEndCounting?(countdownButton: self)
    }
    
    
    @objc private func updateTime() {
        self.remainingSeconds -= 1
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        self.layoutIfNeeded()
//        self.layer.borderWidth = 1.0
//        self.layer.cornerRadius = self.frame.size.height/2
//        self.layer.masksToBounds = true
        self.isEnabled = true
        self.isCounting = false
        
//        self.bgColorForEnable = YLH_Color_ThemeYellow
//        self.bgColorForDisable = YLH_Color_ThemeButtonBgGray
        self.titleColorForEnable = BAKit_Color_White
        self.titleColorForDisable = BAKit_Color_White
        self.titleColorForCountingDisable = BAKit_Color_White
    }
    
    open override var isEnabled: Bool {
        willSet {
            if newValue {
                self.backgroundColor = self.bgColorForEnable
                self.layer.borderColor = self.borderColorForEnable?.cgColor
                self.setTitleColor(self.titleColorForEnable, for: .normal)
            } else {
                self.backgroundColor = self.bgColorForDisable
                self.layer.borderColor = self.borderColorForDisable?.cgColor
                if self.isCounting {
                    self.setTitleColor(self.titleColorForCountingDisable, for: .normal)
                } else {
                    self.setTitleColor(self.titleColorForDisable, for: .normal)
                }
            }
        }
    }
}
