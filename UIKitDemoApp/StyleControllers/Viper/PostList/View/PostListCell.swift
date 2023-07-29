//
//  PostTableViewCell.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/20.
//

import UIKit
import AlamofireImage

class PostListCell: CommonListCell<PostModel> {
    
    var postImageView: UIImageView
    var postTitleLabel: UILabel
    var postDetailLabel: UILabel
    
    override var item: PostModel? {
        didSet {
            if let p = self.item {
                print("p.imageUrl==>\(p.imageUrl)")
                let placeholderImage = UIImage(named: "placeholder")!
                self.postImageView.af_setImage(withURL: URL(filePath: p.imageUrl), placeholderImage: placeholderImage)
                self.postTitleLabel.text = p.title
                self.postDetailLabel.text = p.detail
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        postImageView = UIImageView()
        postTitleLabel = UILabel(frame: .zero)
        postDetailLabel = UILabel(frame: .zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        print("PostListCell.init invoked")
    }
    
    func setupViews(){
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.layer.cornerRadius = 5
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        
        postTitleLabel.textColor = UIColor.fontColor
        postTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        contentView.addSubview(postTitleLabel)
        postTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(postImageView.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-20)
            make.top.equalTo(postImageView)
        }
        
        postDetailLabel.textColor = .gray
        postDetailLabel.font = UIFont.systemFont(ofSize: 15)
        postDetailLabel.numberOfLines = 3
        contentView.addSubview(postDetailLabel)
        postDetailLabel.snp.makeConstraints { make in
            make.left.equalTo(postTitleLabel)
            make.right.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
}
