//
//  ViewController.swift
//  xdanmu
//
//  Created by wangyu on 2023/7/21.
//

import UIKit

class ViewController: UIViewController {

    var danmuView: XDanMuView = XDanMuView()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        danmuView.frame = .init(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height - 200)
        self.view.addSubview(danmuView)
        // 配置项目
        danmuView.minSpeed = 1
        danmuView.maxSpeed = 2
        danmuView.gap = 20
        danmuView.lineHeight = 30
        // 启动弹幕
        danmuView.start()
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(addDanMu), userInfo: nil, repeats: false)
        
        var switchBtn = UIButton.init(frame: .init(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height - 300, width: 200, height: 60))
        switchBtn.setTitle("开始/暂停", for: .normal)
        switchBtn.setTitleColor(.black, for: .normal)
        switchBtn.addTarget(self, action: #selector(switchDanMuStatus), for: .touchUpInside)
        self.view.addSubview(switchBtn)
    }
    
    @objc func switchDanMuStatus() {
        danmuView.isPause = !danmuView.isPause
    }
    
    @objc func addDanMu() {
        let interval = CGFloat.random(in: 0.3...1.0)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(addDanMu), userInfo: nil, repeats: false)
        
        var text = ""
        for _ in 0...Int.random(in: 1...30) {
            text += "嘿"
        }
        for _ in 0...Int.random(in: 1...2) {
            danmuView.addDanMu(text: text, isMe: Bool.random())
        }
    }
}

