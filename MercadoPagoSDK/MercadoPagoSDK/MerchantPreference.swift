//
//  MerchantPreference.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 23/12/15.
//  Copyright © 2015 MercadoPago. All rights reserved.
//

import UIKit

public class MerchantPreference: NSObject {
    public var items : [Item]?

    public override init() {
        super.init()
    }
    
    public func toJSONString() -> String {
        let obj:[String:AnyObject] = [
            "items": (self.items != nil && self.items!.count > 0) ? self.items! : JSON.null
        ]
        return JSON(obj).toString()
    }
    
}
