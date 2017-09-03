//
//  IconsEnum.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/3/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import UIKit

enum Icon {
    case accepted
    case rejected
    case bizagiOrange
    case bizagiGreen
    
    var image: UIImage {
        switch self {
        case .accepted:
            return UIImage(named: "icon_accept")!
        case .rejected:
            return UIImage(named: "icon_reject")!
        case .bizagiOrange:
            return UIImage(named: "icon_bizagi_orange")!
        case .bizagiGreen:
            return UIImage(named: "icon_bizagi_green")!
        }
    }
}
