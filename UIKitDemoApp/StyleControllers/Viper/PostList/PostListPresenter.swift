//
//  PostListPresenter.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
}

extension PostListPresenter: PostListInteractorOutputProtocol {
    func didRetrievePosts(_ posts: [PostModel]) {
        print("posts.count==>\(posts.count)")
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
