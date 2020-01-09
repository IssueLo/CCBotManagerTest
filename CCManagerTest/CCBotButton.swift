//
//  CCBotButton.swift
//  CCManagerTest
//
//  Created by 戴汝羽 on 2020/1/9.
//  Copyright © 2020 KevinKLLo. All rights reserved.
//

import UIKit
import SDWebImage

public class CCBotButton: UIButton {
    
    var superVC: UIViewController
    var bottomSpace: CGFloat
    var iconURL: URL?
    
    public required init(belongVC: UIViewController, bottomSpace: CGFloat = 50, iconURLString: String = "https://lh3.googleusercontent.com/7hNVq4eXYDqKikz_x6QUIN1x3ArrF3IzcaNWS6TQpna79BIWfNfnRviifT6hBugE7mYpKpiM7Ps7YN5XkGFmXaTyTKjiYsUoNquxGvQ=h128") {
        self.superVC = belongVC
        self.bottomSpace = bottomSpace
        self.iconURL = URL(string: iconURLString) ?? nil
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func build() {
        setAutoLayout(into: superVC.view)
        buttonImage()
        setAction()
    }
    
    private func setAutoLayout(into superView: UIView?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let superView = superView {
            superView.addSubview(self)
            self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: -self.bottomSpace).isActive = true
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0).isActive = true
            self.widthAnchor.constraint(equalToConstant: 44).isActive = true
            self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
    }
    
//    public static var imageBundle: Bundle {
//        let path = Bundle(for: CCBotButton.self).resourcePath! // + "CCBotManager.bundle"
//        return Bundle(path: path)!
//    }
//
//    private func buttonImage(_ name: String = "iconUdnMember") {
//        self.setImage(UIImage(named: name, in: CCBotButton.imageBundle, compatibleWith: nil) , for: .normal)
//        self.imageView?.contentMode = .scaleAspectFill
//    }
    
    private func buttonImage() {
//        self.setImage(UIImage(named , for: .normal)
        self.sd_setImage(with: iconURL, for: .normal, completed: nil)
        self.backgroundColor = .gray
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    private func setAction() {
        self.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
    }

    @objc
    private func toNextPage() {
        superVC.present(CCBotViewController.shared, animated: true, completion: nil)
    }
}

fileprivate class ThisClass {}

public struct Resources {
    public static var bundle: Bundle {
        return Bundle(for: ThisClass.self)
    }
}
