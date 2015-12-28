//
//  Preference.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 23/12/15.
//  Copyright © 2015 MercadoPago. All rights reserved.
//

import UIKit

public class CheckoutPreference : NSObject {

    public var id : String!
    public var items : [Item]?
    public var payer : Payer?
    //verificar campos
    //public var paymentMethods : [PaymentMethod]?
    //var shipments : [Shipment]
    
    public class func fromJSON(json : NSDictionary) -> CheckoutPreference {
        let preference : CheckoutPreference = CheckoutPreference()
        
        if json["id"] != nil && !(json["id"]! is NSNull) {
            preference.id = (json["id"]! as? String)
        }
        
        if json["payer"] != nil && !(json["payer"]! is NSNull) {
            preference.payer = Payer.fromJSON(json["payer"]! as! NSDictionary)
        }
        
        var items = [Item]()
        if let itemsArray = json["items"] as? NSArray {
            for i in 0..<itemsArray.count {
                if let itemDic = itemsArray[i] as? NSDictionary {
                   items.append(Item.fromJSON(itemDic))
                }
            }

            preference.items = items
        }
     
        return preference
    }
    
}
