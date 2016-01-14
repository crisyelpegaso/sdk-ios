//
//  PaymentMethod.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 6/3/15.
//  Copyright (c) 2015 com.mercadopago. All rights reserved.
//

import Foundation

public class PaymentMethod : Serializable {
    

       
    public var _id : String!
    public var name : String!
    public var paymentTypeId : String!
    public var settings : [Setting]!
    public var additionalInfoNeeded : [String]!
    
    public func isIssuerRequired() -> Bool {
        return isAdditionalInfoNeeded("issuer_id")
    }
    
    public func isSecurityCodeRequired(bin: String) -> Bool {
        
        let setting : Setting? = Setting.getSettingByBin(settings, bin: bin)
        if setting != nil && setting!.securityCode.length != 0 {
            return true
        } else {
            return false
        }
    }
    
    public func isAdditionalInfoNeeded(param: String!) -> Bool {
        if additionalInfoNeeded != nil && additionalInfoNeeded.count > 0 {
            for info in additionalInfoNeeded {
                if info == param {
                    return true
                }
            }
        }
        return false
    }
    
    public class func fromJSON(json : NSDictionary) -> PaymentMethod {
        let paymentMethod : PaymentMethod = PaymentMethod()
        paymentMethod._id = JSON(json["id"]!).asString
        paymentMethod.name = JSON(json["name"]!).asString

		if json["payment_type_id"] != nil && !(json["payment_type_id"]! is NSNull) {
			paymentMethod.paymentTypeId = json["payment_type_id"] as? String
		}
		
        var settings : [Setting] = [Setting]()
        if let settingsArray = json["settings"] as? NSArray {
            for i in 0..<settingsArray.count {
                if let settingDic = settingsArray[i] as? NSDictionary {
                    settings.append(Setting.fromJSON(settingDic))
                }
            }
        }
        paymentMethod.settings = settings
        var additionalInfoNeeded : [String] = [String]()
        if let additionalInfoNeededArray = json["additional_info_needed"] as? NSArray {
            for i in 0..<additionalInfoNeededArray.count {
                if let additionalInfoNeededStr = additionalInfoNeededArray[i] as? String {
                    additionalInfoNeeded.append(additionalInfoNeededStr)
                }
            }
        }
        paymentMethod.additionalInfoNeeded = additionalInfoNeeded
        return paymentMethod
    }
    
}