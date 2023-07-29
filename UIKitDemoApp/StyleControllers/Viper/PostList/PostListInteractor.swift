//
//  PostListInteractor.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit

class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    var localDatamanager: PostListLocalDataManagerInputProtocol?
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            if let postList = try localDatamanager?.retrievePostList() {
                print("1")
                debugPrint(postList)
                let postModelList = postList.map() {
                    print("2")
                    return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!, detail: $0.detail!)
                }
                debugPrint(postModelList)
                if postModelList.isEmpty {
                    print("3")
                    remoteDatamanager?.retrievePostList()
                } else{
                    print("4")
                    presenter?.didRetrievePosts(postModelList)
                }
            } else {
                print("5")
                remoteDatamanager?.retrievePostList()
            }
        } catch {
            print("6")
            presenter?.didRetrievePosts([])
        }
    }
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    func onPostsRetrieved(_ posts: [PostModel]) {
        print("PostListInteractor.onPostsRetrieved===>ok")
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDatamanager?.savePost(id: postModel.id, title: postModel.title, imageUrl: postModel.imageUrl, thumbImageUrl: postModel.thumbImageUrl, detail: postModel.detail)
            } catch let error {
                debugPrint("save to local error: \(error)")
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
}
