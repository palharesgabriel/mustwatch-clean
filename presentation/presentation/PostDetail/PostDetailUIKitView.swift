//
//  PostDetailUIKitView.swift
//  presentation
//
//  Created by Gabriel Palhares on 05/09/21.
//

import UIKit

class PostDetailUIKitView: UIView {
    
    public var postDetailVM: PostDetailVM
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = postDetailVM.details
        return label
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = postDetailVM.description
        view.font = UIFont.systemFont(ofSize: 16)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        return view
    }()
    
    public init(postDetailVM: PostDetailVM) {
        self.postDetailVM = postDetailVM
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(titleLabel)
        addSubview(contentView)
        contentView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65),
            contentView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
}
