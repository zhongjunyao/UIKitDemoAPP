//
//  PostDetailView.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit
import SnapKit
import AlamofireImage

class PostDetailViewController: BaseViewController {
    var presenter: PostDetailPresenterProtocol?
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var detailLabel: UILabel!
    
    var item: PostModel?
    
    override func viewDidLoad() {
        imageView = UIImageView()
        titleLabel = UILabel(frame: .zero)
        detailLabel = UILabel(frame: .zero)
        super.viewDidLoad()
        title = "产品详情"
        setupViews()
        presenter?.viewDidLoad()
    }
    
    private func setupViews(){
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(250)
        }

        titleLabel.textColor = UIColor.fontColor
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }

        detailLabel.textColor = .lightGray
        detailLabel.font = UIFont.systemFont(ofSize: 15)
        detailLabel.numberOfLines = 0
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
}

extension PostDetailViewController: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: PostModel) {
        let placeholderImage = UIImage(named: "placeholder")!
        self.imageView.af_setImage(withURL: URL(filePath: post.imageUrl), placeholderImage: placeholderImage)
        self.titleLabel.text = post.title
        self.detailLabel.text = post.detail
    }
    
}
