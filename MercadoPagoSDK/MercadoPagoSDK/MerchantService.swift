//
//  MerchantService.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 31/12/14.
//  Copyright (c) 2014 com.mercadopago. All rights reserved.
//

import Foundation
import UIKit

public class MerchantService : MercadoPagoService {
    
    var createPaymentUri : String?
    var getCustomerUri : String?
    var getDiscountUri : String?
    var createPreferenceUri : String?
    
    public var data: NSMutableData = NSMutableData()
    
    init (baseURL : String, getCustomerUri : String) {
        super.init(baseURL: baseURL)
        self.getCustomerUri = getCustomerUri
    }
    
    init (baseURL : String, createPaymentUri : String) {
        super.init(baseURL: baseURL)
        self.createPaymentUri = createPaymentUri
    }
    
    init (baseURL : String, getDiscountUri : String) {
        super.init(baseURL: baseURL)
        self.getDiscountUri = getDiscountUri
    }
    
    init (baseURL : String, createPreferenceUri : String) {
        super.init(baseURL: baseURL)
        self.createPreferenceUri = createPreferenceUri
    }
    
    public func getCustomer(method : String = "GET", merchant_access_token : String, success: (jsonResult: AnyObject?) -> Void, failure: ((error: NSError) -> Void)?) {
        self.request(getCustomerUri!, params: "merchant_access_token=" + merchant_access_token, body: nil, method: method, success: success, failure: failure)
    }
    
    public func createPayment(method : String = "POST", payment : MerchantPayment, success: (jsonResult: AnyObject?) -> Void, failure: ((error: NSError) -> Void)?) {
        self.request(createPaymentUri!, params: nil, body: payment.toJSONString(), method: method, success: success, failure: failure)
    }
    
    public func createPreference(method : String = "POST", preference : MerchantPreference, success: (jsonResult: AnyObject?) -> Void, failure: ((error: NSError) -> Void)?) {
        self.request(createPreferenceUri!, params: nil, body: preference.toJSONString(), method: method, success: success, failure: failure)
    }
}