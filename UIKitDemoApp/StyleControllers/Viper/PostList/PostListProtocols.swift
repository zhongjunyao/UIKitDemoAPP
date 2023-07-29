//
//  PostListProtocols.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/20.
//

import Foundation
import UIKit

protocol PostListViewProtocol: AnyObject {
    var presenter: PostListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPosts(with posts: [PostModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol PostListWireFrameProtocol: AnyObject {
    static func createPostListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

protocol PostListPresenterProtocol: AnyObject {
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorInputProtocol? { get set }
    var wireFrame: PostListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPostDetail(forPost post: PostModel)
}

protocol PostListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}

protocol PostListInteractorInputProtocol: AnyObject {
    var presenter: PostListInteractorOutputProtocol? { get set }
    var localDatamanager: PostListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrievePostList()
}

protocol PostListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol PostListRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrievePostList()
}

protocol PostListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onPostsRetrieved(_ posts: [PostModel])
    func onError()
}

protocol PostListLocalDataManagerInputProtocol: AnyObject {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrievePostList() throws -> [Post]
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String, detail: String) throws
}

