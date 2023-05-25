//
//  UIPickerViewViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UIPickerViewViewController: BaseViewController {

    var pickerView: UIPickerView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five",
    ]
    
    // 列数，每列行数
    var column: Int = 2
    var numberPerColumn: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIPickerView-选择器视图"
        
        setupViews()
    }
    
    func setupViews(){
        pickerView = UIPickerView()
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(200)
        }
        
        // 设置数据源、代理
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
}

extension UIPickerViewViewController: UIPickerViewDataSource {
    // 获取分区数量(多少列)时，回调
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return column
    }
    
    // 获取每个分区(列)的行数时，回调
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberPerColumn
    }

}

extension UIPickerViewViewController: UIPickerViewDelegate {
    // 行被选中时，回调
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("pickerView didSelectRow invoked, row index:", row, ", in component index:", component)
    }

    // 设置每行的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }
    
    // 设置每行的高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        print("pickerView rowHeightForComponent invoked, component index:", component)
        return 30
    }
    
    // 设置每列的宽度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        print("pickerView widthForComponent invoked, component index:", component)
        return (view.frame.width - 40) / CGFloat(column)
    }

//    // 自定义行的view，回调
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        print("pickerView viewForRow invoked, row index:", row, ", component index:", component)
//        return view ?? UIView()
//    }

    // 设置行文本样式，并返回富文本字符串
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        print("pickerView attributedTitleForRow invoked, row index:", row, ", component index:", component)
        
        let attributes: [NSAttributedString.Key : Any]? = [
            .strokeWidth: 2,
            .strokeColor: UIColor.orange.cgColor,
            .font: UIFont.systemFont(ofSize: 25, weight: .bold)
        ]
        
        return NSAttributedString(string: dataArray[row], attributes: attributes)
    }
}
