//
//  PostDetailWireFrame.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit

class PostDetailWireFrame: PostDetailWireFrameProtocol {
    
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController {
        let view: UIViewController & PostDetailViewProtocol = PostDetailViewController()
        let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
        let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.post = post
        presenter.wireFrame = wireFrame
        
        return view
    }
    
}

