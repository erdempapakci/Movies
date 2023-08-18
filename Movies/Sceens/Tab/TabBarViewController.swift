//
//  TabBarViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit



final class TabBarViewController: BaseTabBarView {
    
   private lazy var upperLineView: UIView = UIView()
    
    let spacing: CGFloat = 12
    
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        delegate = self
        
        configureAppearance()
        configureViewControllers()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    func configureAppearance() {
        UITabBar.appearance().tintColor = .red
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        let newTabBarHeight: CGFloat = 100
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        tabBar.frame = newFrame
        
        tabBar.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime{
            upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 2))
        upperLineView.backgroundColor = UIColor.systemPink
        tabBar.addSubview(upperLineView)
    }
   
    
    private func configureViewControllers() {
        
        let searchViewController = UINavigationController(rootViewController: TabBarItem.search.viewControllers)
        let savedViewController = UINavigationController(rootViewController: TabBarItem.saved.viewControllers)
        navigationController?.navigationBar.barTintColor = .green
        searchViewController.tabBarItem = UITabBarItem(title: TabBarItem.search.title, image: TabBarItem.search.icons, tag: TabBarItem.search.rawValue)
        savedViewController.tabBarItem = UITabBarItem(title: TabBarItem.saved.title, image: TabBarItem.search.icons, tag: TabBarItem.saved.rawValue)
        self.setViewControllers([searchViewController, savedViewController], animated: true)
        
    }
    
}
extension TabBarViewController {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
