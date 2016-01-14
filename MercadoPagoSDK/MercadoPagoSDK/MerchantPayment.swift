//
//  MerchantPayment.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 31/12/14.
//  Copyright (c) 2014 com.mercadopago. All rights reserved.
//

import Foundation

public class MerchantPayment : NSObject {
    public var cardIssuerId : NSNumber = 0
    public var cardToken : String!
    public var campaignId : Int = 0
    public var installments : Int = 0
    public var items : [Item]!
    public var merchantAccessToken : String!
    public var paymentMethodId : String!
    
    public override init() {
        super.init()
    }
    
    public init(items: [Item], installments: Int, cardIssuerId: NSNumber, token: String, paymentMethodId: String, campaignId: Int, merchantAccessToken: String) {
        self.items = items
        self.installments = installments
        self.cardIssuerId = cardIssuerId
        self.cardToken = token
        self.paymentMethodId = paymentMethodId
        self.campaignId = campaignId
        self.merchantAccessToken = merchantAccessToken
    }
    
    public func toJSONString() -> String {
        let obj:[String:AnyObject] = [
            "card_issuer_id": self.cardIssuerId == 0 ? JSON.null : self.cardIssuerId,
            "card_token": self.cardToken == nil ? JSON.null : self.cardToken!,
            "campaign_id": self.campaignId == 0 ? JSON.null : String(self.campaignId),
            //TODO
            //"items": self.items == nil ? JSON.null : JSON.parse(self.item!.toJSONString()).mutableCopyOfTheObject(),
            "installments" : self.installments == 0 ? JSON.null : self.installments,
            "merchant_access_token" : self.merchantAccessToken == nil ? JSON.null : self.merchantAccessToken!,
            "payment_method_id" : self.paymentMethodId == nil ? JSON.null : self.paymentMethodId!
        ]
        return JSON(obj).toString()
    }
    
}