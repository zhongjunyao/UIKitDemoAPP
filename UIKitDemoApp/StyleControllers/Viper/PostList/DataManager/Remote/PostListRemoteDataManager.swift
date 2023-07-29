//
//  PostListRemoteDataManager.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol {
    
    weak var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[PostModel]>) in
                print("response:")
                debugPrint(response)
                switch response.result {
                case .success(let posts):
                    print("success")
                    debugPrint(posts)
                    self.remoteRequestHandler?.onPostsRetrieved(posts)
            
                case .failure( _):
                    print("failure")
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
