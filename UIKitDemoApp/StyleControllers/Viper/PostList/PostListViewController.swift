//
//  PostListView.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit
import PKHUD

class PostListViewController: BaseViewController, CommonListDelegate {
    
    var presenter: PostListPresenterProtocol?
    var postListView: CommonList<PostModel, PostListCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "产品列表"
        setupViews()
        presenter?.viewDidLoad()
    }
    
    func setupViews(){
        postListView = CommonList<PostModel, PostListCell>()
        postListView.delegate = self
        
        view.addSubview(postListView)
        postListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - CommonListDelegate
    func didSelectItem<CommonListItem>(item: CommonListItem) {
        presenter?.showPostDetail(forPost: item as! PostModel)
    }
    
}

extension PostListViewController: PostListViewProtocol {
    func showPosts(with posts: [PostModel]) {
        postListView.items = posts
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    
}

