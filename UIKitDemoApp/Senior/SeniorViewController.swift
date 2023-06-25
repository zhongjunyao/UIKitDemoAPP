//
//  SeniorViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

import UIKit

class SeniorViewController: BaseViewController {
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    lazy var items: [CommonCellModel] = [
        CommonCellModel(title: "重载操作符", commonCellFlag: "cell-1"),
        CommonCellModel(title: "Swift与OC交互", commonCellFlag: "cell-2"),
        CommonCellModel(title: "UIKit与SwiftUI交互", commonCellFlag: "cell-3"),
        CommonCellModel(title: "页面添加侧滑手势", commonCellFlag: "cell-4"),
        CommonCellModel(title: "async与await使用", commonCellFlag: "cell-5"),
        CommonCellModel(title: "KVO使用", commonCellFlag: "cell-6"),
        CommonCellModel(title: "Combine使用", commonCellFlag: "cell-7"),
        CommonCellModel(title: "获取plist文件", commonCellFlag: "cell-8"),
        CommonCellModel(title: "Accessibility的使用", commonCellFlag: "cell-9"),
//        CommonCellModel(title: "UISegmentedControl-分段控制器控制页面", commonCellFlag: "segmentedCell2"),
//        CommonCellModel(title: "UITextField-输入框", commonCellFlag: "textFieldCell"),
//        CommonCellModel(title: "UISlider-滑块控件属性", commonCellFlag: "sliderCell"),
//        CommonCellModel(title: "UISlider-滑块控制图片大小", commonCellFlag: "sliderCell2"),
//        CommonCellModel(title: "UIActivityIndicatorView-提示器", commonCellFlag: "activityIndicatorCell"),
//        CommonCellModel(title: "UIProgressView-进度条", commonCellFlag: "progressCell"),
//        CommonCellModel(title: "UIPageControl-分页控制器", commonCellFlag: "pageControlCell"),
//        CommonCellModel(title: "UIStepperView-步进控制器", commonCellFlag: "stepperCell"),
//
//        CommonCellModel(title: "UIAlertView-警告框", commonCellFlag: "alertCell"),
//        CommonCellModel(title: "UIAlertController-警告控制器-警告框风格", commonCellFlag: "alertCell2"),
//        CommonCellModel(title: "UIActionSheet-活动列表", commonCellFlag: "actionSheetCell"),
//        CommonCellModel(title: "UIAlertController-警告控制器-活动列表风格", commonCellFlag: "actionSheetCell2"),
//
//        CommonCellModel(title: "UIScrollView-滚动视图控件属性", commonCellFlag: "scrollViewCell"),
//        CommonCellModel(title: "UIScrollView-滚动视图代理事件", commonCellFlag: "scrollViewCell2"),
//
//        CommonCellModel(title: "UITableView-表格视图-普通风格", commonCellFlag: "tableViewPlainCell"),
//        CommonCellModel(title: "UITableView-表格视图-分组风格", commonCellFlag: "tableViewGroupedCell"),
//        CommonCellModel(title: "UITableView-表格视图-头部尾部其他", commonCellFlag: "tableViewHeaderAndFooterCell"),
//        CommonCellModel(title: "UITableView-表格视图-编辑", commonCellFlag: "tableViewEditingCell"),
//        CommonCellModel(title: "UITableView-表格视图-移动", commonCellFlag: "tableViewMovingCell"),
//
//
//        CommonCellModel(title: "UITextView-文本视图", commonCellFlag: "textViewCell"),
//        CommonCellModel(title: "UIPickerView-选择器视图", commonCellFlag: "pickerViewCell"),
//        CommonCellModel(title: "UIDatePicker-日期选择器", commonCellFlag: "datePickerCell"),
//
//        CommonCellModel(title: "UIWebView-网页视图", commonCellFlag: "webViewCell"),
//        CommonCellModel(title: "WKWebView-网页视图", commonCellFlag: "wkWebViewCell"),
//
//        CommonCellModel(title: "UICollectionViewFlowLayout-瀑布流视图", commonCellFlag: "collectionViewFlowLayoutCell"),
//        CommonCellModel(title: "UICollectionViewFlowLayout-设置cell大小", commonCellFlag: "collectionViewFlowLayoutCell2"),
//        CommonCellModel(title: "UICollectionView-自定义布局", commonCellFlag: "collectionViewCustomLayoutCell"),
//
//        CommonCellModel(title: "UIStackView-栈视图", commonCellFlag: "stackViewCell"),
//        CommonCellModel(title: "UINavigationController-导航控制器", commonCellFlag: "navigationCell"),
//        CommonCellModel(title: "UITabBarController-标签控制器", commonCellFlag: "tabBarCell"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Senior-功能页"
        
        print("featureConfig==>", featureConfig[0], featureConfig[1])
        setupViews()
    }
    
    func setupViews(){
        stackView = UIStackView()
        stackView.axis = .vertical
        
        var cell: CommonCell?
        for idx in items.indices {
            cell = CommonCell()
            cell?.title = items[idx].title
            cell?.commonCellFlag = items[idx].commonCellFlag
            cell?.addTarget(self, action: #selector(didClickCell(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(cell!)
            cell?.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.height.equalTo(55)
            }
            
            items[idx].cell = cell
        }
        
        scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        let safeAreaInsertsBottom = CommonUtil.getSafeAreaInsertsBottom(self)
        print("safeAreaInsertsBottom===>", safeAreaInsertsBottom)
        let sizeHeight: CGFloat = CGFloat(items.count * 55) + safeAreaInsertsBottom
        scrollView.contentSize = CGSizeMake(view.bounds.width, sizeHeight)
        
        // 视图滚动到底部
        scrollView.contentOffset = CGPointMake(0, sizeHeight)
    }
    
    @objc func didClickCell(_ sender: CommonCell)->Void{
        var targetVC: UIViewController? = nil
        
        switch sender.commonCellFlag {
        case "cell-1":
            targetVC = ReloadOperater()
        case "cell-2":
            targetVC = SwiftOCInteraction()
        case "cell-3":
            targetVC = UIKitViewController()
        case "cell-4":
            targetVC = UIScreenEdgePanGestureRecognizerViewController()
        case "cell-5":
            targetVC = AsyncAwaitViewController()
        case "cell-6":
            targetVC = KVOViewController()
        case "cell-7":
            targetVC = CombineViewController()
        case "cell-8":
            targetVC = GetPlistViewController()
        case "cell-9":
            targetVC = AccessibilityViewController()
//        case "textFieldCell":
//            targetVC = UITextFieldController()
//        case "sliderCell":
//            targetVC = UISliderViewController()
//        case "sliderCell2":
//            targetVC = UISliderViewController2()
//        case "activityIndicatorCell":
//            targetVC = UIActivityIndicatorViewController()
//        case "progressCell":
//            targetVC = UIProgressViewController()
//        case "pageControlCell":
//            targetVC = UIPageControlViewController()
//        case "stepperCell":
//            targetVC = UIStepperViewController()
//        case "alertCell":
//            targetVC = UIAlertViewViewController()
//        case "alertCell2":
//            targetVC = UIAlertControllerViewController()
//        case "actionSheetCell":
//            targetVC = UIActionSheetViewController()
//        case "actionSheetCell2":
//            targetVC = UIAlertControllerViewController2()
//        case "scrollViewCell":
//            targetVC = UIScrollViewViewController()
//        case "scrollViewCell2":
//            targetVC = UIScrollViewViewController2()
//
//        case "tableViewPlainCell":
//            targetVC = UITableViewPlainViewController()
//        case "tableViewGroupedCell":
//            targetVC = UITableViewGroupedViewController()
//        case "tableViewHeaderAndFooterCell":
//            targetVC = UITableViewHeaderAndFooterViewController()
//        case "tableViewEditingCell":
//            targetVC = UITableViewEditingViewController()
//        case "tableViewMovingCell":
//            targetVC = UITableViewMovingViewController()
//
//        case "textViewCell":
//            targetVC = UITextViewViewController()
//        case "pickerViewCell":
//            targetVC = UIPickerViewViewController()
//        case "datePickerCell":
//            targetVC = UIDatePickerViewController()
//        case "webViewCell":
//            targetVC = UIWebViewViewController()
//        case "wkWebViewCell":
//            targetVC = WKWebViewViewController()
//
//        case "collectionViewFlowLayoutCell":
//            targetVC = UICollectionViewFlowLayoutViewController()
//        case "collectionViewFlowLayoutCell2":
//            targetVC = UICollectionViewFlowLayoutViewController2()
//        case "collectionViewCustomLayoutCell":
//            targetVC = UICollectionViewCustomLayoutViewController()
//
//        case "stackViewCell":
//            targetVC = UIStackViewViewController()
//        case "navigationCell":
//            targetVC = UINavigationControllerViewController()
//        case "tabBarCell":
//            targetVC = UITabBarControllerViewController()
        default:
            print("never found matched item: \(String(describing: sender.commonCellFlag))")
        }
        if targetVC != nil {
            targetVC?.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(targetVC!, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 返回页面恢复 tabBar
        hidesBottomBarWhenPushed = false
    }
    
}
