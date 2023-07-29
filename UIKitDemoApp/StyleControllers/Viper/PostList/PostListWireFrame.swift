//
//  PostListWireFrame.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/20.
//

import UIKit

class PostListWireFrame: PostListWireFrameProtocol {

    class func createPostListModule() -> UIViewController {
        let view: UIViewController & PostListViewProtocol = PostListViewController()
        let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
        let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
        let interactor: PostListInteractorInputProtocol & PostListRemoteDataManagerOutputProtocol = PostListInteractor()
        let localDatamanager: PostListLocalDataManagerInputProtocol = PostListLocalDataManager()
        let remoteDatamanager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDatamanager
        interactor.remoteDatamanager = remoteDatamanager
        remoteDatamanager.remoteRequestHandler = interactor
        
        return view
    }

    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel) {
        let postDetailView = PostDetailWireFrame.createPostDetailModule(forPost: post)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(postDetailView, animated: true)
        }
    }
}
