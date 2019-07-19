//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCoreUI
import SuperArcCore
import SuperArcFoundation

class DashboardViewController: TabBarController, StoryboardInitiable {

    static var storyboardName = "Dashboard"

    // MARK: Setup

    override func setupViews() {
        super.setupViews()

        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }

}
