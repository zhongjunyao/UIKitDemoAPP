//
//  UIDatePickerViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UIDatePickerViewController: BaseViewController {
    
    var stackView: UIStackView!
    
    var datePickerTime: UIDatePicker!
    var datePickerDate: UIDatePicker!
    var datePickerDateAndTime: UIDatePicker!
    var datePickerCountDownTimer: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIDatePicker-日期选择器"
        
        setupViews()
    }
    
    func setupViews(){
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        
        datePickerTime = createPickerAndAddToStackView(stackView: stackView, mode: .time)
        datePickerDate = createPickerAndAddToStackView(stackView: stackView, mode: .date)
        datePickerDateAndTime = createPickerAndAddToStackView(stackView: stackView, mode: .dateAndTime)
        datePickerCountDownTimer = createPickerAndAddToStackView(stackView: stackView, mode: .countDownTimer)
        
        datePickerDateAndTime.addTarget(self, action: #selector(changeDate(_:)), for: .valueChanged)
        
    }
    
    @objc func changeDate(_ sender: UIDatePicker){
        let date = sender.date
        print("date==>", date)
    }
    
    func createPickerAndAddToStackView(stackView: UIStackView, mode: UIDatePicker.Mode, height: CGFloat? = 120) -> UIDatePicker {
        let datePicker = UIDatePicker()
        stackView.addArrangedSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(height!)
        }
        
        // 设置日期模式
        datePicker.datePickerMode = mode
        
        return datePicker
    }
}
