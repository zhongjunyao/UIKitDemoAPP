//
//  UISegmentedController2.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/26.
//
import UIKit

class UISegmentedViewController2: BaseViewController {
    // get the width and height of screen
    let screenSize: CGSize = UIScreen.main.bounds.size
    var viewBlue:UIView!
    var viewRed:UIView!
    var viewYellow:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISegmentedControl-分段控制器控制页面"
        
        let rect:CGRect = CGRect(x:0, y:0, width:screenSize.width, height:screenSize.height)
        viewBlue = UIView(frame: rect)
        viewRed = UIView(frame: rect)
        viewYellow = UIView(frame: rect)
        // set bg color
        viewBlue.backgroundColor = UIColor.blue
        viewRed.backgroundColor = UIColor.red
        viewYellow.backgroundColor = UIColor.yellow
        
        // Do any additional setup after loading the view.
        let seg: UISegmentedControl = UISegmentedControl(items: ["blue", "red", "yellow"])
        
        seg.addTarget(self, action: #selector(handleValueChnage), for: UIControl.Event.valueChanged)
        
        seg.selectedSegmentIndex = 0
        
        self.navigationItem.titleView = seg
        
        // add view to view controllor
        self.view.addSubview(viewBlue)
        self.view.addSubview(viewRed)
        self.view.addSubview(viewYellow)
        
        // move blue view to the front
        self.view.bringSubviewToFront(viewBlue)
    }
    
    @objc func handleValueChnage(seg:UISegmentedControl){
        var targetView: UIView!
        
        switch(seg.selectedSegmentIndex){
            case 0:
                targetView = viewBlue
                break
            
            case 1:
                targetView = viewRed
                break
            
            default:
                targetView = viewYellow
                break
        }
        self.view.bringSubviewToFront(targetView)
    }
}

