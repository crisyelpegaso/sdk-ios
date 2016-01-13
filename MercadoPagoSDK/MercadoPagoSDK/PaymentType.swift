//
//  PaymentType.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 13/1/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class PaymentType: NSObject {

    var id : String!
    
    override public init(){
        super.init()
    }
    
    public class func fromJSON(json : NSDictionary) -> PaymentType {
        let paymentType = PaymentType()
        if json["id"] != nil && !(json["id"]! is NSNull) {
            paymentType.id = json["id"] as? String
        }
        return paymentType
    }
}
