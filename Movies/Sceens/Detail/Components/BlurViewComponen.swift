//
//  BlurViewComponen.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit


final class BlurViewComponent: GenericBaseView<UIImageView> {
    
    private lazy var backgroundImage: UIImageView = .init() &> {
   
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
    }
    private lazy var effectView: UIVisualEffectView = .init() &> {
        let blurEffect = UIBlurEffect(style: .dark)
        $0.effect = blurEffect
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.effectView.frame = frame
        self.backgroundImage.frame = frame
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureView() {
        super.configureView()
      
        addSubview(backgroundImage)
        addSubview(effectView)
      
        NSLayoutConstraint.activate([
            effectView.topAnchor.constraint(equalTo: topAnchor),
            effectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            effectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

